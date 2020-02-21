class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    # if @message.save
    MessageMailer.send_mail(@message).deliver
    flash[:success] = 'お問い合わせありがとうございます!'
    redirect_to root_path
    # else
    #   render :new
    # end
  end

  private
  def message_params
    params.require(:message).permit(:email, :content)
  end
  
end
