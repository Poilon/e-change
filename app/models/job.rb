class Job < ActiveRecord::Base
  has_many :user_jobs
  has_many :users, through: :user_jobs
  
  geocoded_by :address
  after_validation :geocode
  
  validate :title
  validate :description
end
