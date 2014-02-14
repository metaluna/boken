class Story < ActiveRecord::Base
  has_many :scenes
  has_many :games
  
  validates :title, presence: true, uniqueness: {case_sensitive: false }
end
