class Message < ActiveRecord::Base
  has_one: :user

  def self.of user
    where(user_id: user.id)
  end
end
