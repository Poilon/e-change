class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]


  def new
    @feedback = Feedback.new
  end

  def create
    @user = User.find_by(email: params[:distant_email])
    if @user
      @user.update_attribute(:time, @user.time + feedback_params[:time].to_i)
      current_user.update_attribute(:time, current_user.time - feedback_params[:time].to_i)

      @feedback = @user.feedbacks.new(feedback_params)
      if @feedback.save
        redirect_to :jobs, notice: 'feedback was successfully created.'
      else
        render :new
      end
    else
      render :new
    end
  end

  def update
    if @feedback.update(@feedback_params)
      redirect_to @feedback, notice: 'feedback was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @feedback.destroy
    redirect_to feedbacks_url, notice: 'feedback was successfully destroyed.'
  end

  private

  def set_feedback
    @feedback = feedback.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:note, :comment, :time)
  end
end
