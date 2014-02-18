class Story < ActiveRecord::Base
  has_many :scenes
  has_many :games
  belongs_to :user
  
  validates :title, presence: true, uniqueness: {case_sensitive: false }
  validates :user_id, presence: true
end
