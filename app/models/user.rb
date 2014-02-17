class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
       
  validates :username, presence: true, :uniqueness => { :case_sensitive => false }
  validates :email,    presence: true, :uniqueness => { :case_sensitive => false }
  validates :password, presence: true
end
