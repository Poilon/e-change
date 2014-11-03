class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all
    respond_with(@messages)
  end

  def show
    respond_with(@message)
  end

  def new
    @message = Message.new
    @job = Job.find(params[:job])
    render :new
  end

  def edit
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to dashboard_index_path
    else
      render :new
    end
  end

  def update
    @message.update(message_params)
    respond_with(@message)
  end

  def destroy
    @message.destroy
    respond_with(@message)
  end

  private
  
  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:title, :description, :user_id)
  end
end
