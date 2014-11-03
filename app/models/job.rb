class Job < ActiveRecord::Base
  belongs_to :user
  
  geocoded_by :address
  after_validation :geocode
  
  validate :title
  validate :description
end
