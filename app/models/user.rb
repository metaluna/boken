class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
       
  validates :username, presence: true, :uniqueness => { :case_sensitive => false }
  validates :email,    presence: true, :uniqueness => { :case_sensitive => false },
                          format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password, presence: true, confirmation: true
end
