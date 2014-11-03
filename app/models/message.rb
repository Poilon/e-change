class Message < ActiveRecord::Base
  belongs_to :user

  def self.of user
    where(user_id: user.id)
  end
end
