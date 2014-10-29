class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def search    
    distance = params[:distance].blank? ? 10 : params[:distance].to_i 
    @jobs = params[:location].blank? ? Job.all : Job.near(params[:location], distance)
    render :index
  end

  def index
    @jobs = Job.all
  end
end
