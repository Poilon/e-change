class DashboardsController < ApplicationController
  before_filter :authenticate_user!

  def show
    distance = params[:distance].blank? ? 10 : params[:distance].to_i 
    @jobs = Job.where.not(user: current_user)
    @jobs = @jobs.near(params[:location], distance) if params[:location].present?
  end
end
