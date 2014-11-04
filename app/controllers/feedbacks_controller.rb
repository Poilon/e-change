class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]


  def new
    @feedback = Feedback.new
  end

  def create
    @user = User.find_by_email(@feedback_params.delete(:distant_email))
    @user.update_attribute(:time, @user.time + @feedback_params[:time])
    current_time.update_attribute(:time, @user.time - @feedback_params[:time])

    @feedback = @user.feedbacks.new(@feedback_params)
    if @feedback.save
      redirect_to @feedback, notice: 'feedback was successfully created.'
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
    @feedback_params = params.require(:feedback).permit(:note, :comment, :time, :distant_email)
    @feedback_params
  end
end
