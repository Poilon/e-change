class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_jobs
  has_many :jobs, through: :user_jobs

  validate :first_name
  validate :last_name
end
