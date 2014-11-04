class Feedback < ActiveRecord::Base
  belongs_to :user

  attr_accessible :distant_email

end
