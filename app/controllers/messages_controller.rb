class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @received_messages = current_user.received_messages.conversations
    @sent_messages = current_user.sent_messages.conversations
    @messages = @received_messages | @sent_messages
  end

  def new
    @user = User.find(params[:user_id])
  end

  def send_message
    @user = User.find(params[:user_id])
    @message = current_user.send_message(@user,params[:subject], params[:body])
    flash[:notice]= "Your message has been sent to #{@user.first_name}"
    redirect_to blog_path(current_user.blog)
  end

  def reply_message
    @message = Message.find(params[:id])
  end

  def reply
    @host = request.host
    @message = Message.find(params[:message_id])

    @user = User.find(@message.sent_messageable_id)
    @reply_message = current_user.reply_to(@message, params[:body])
    @conversation = @reply_message.conversation
    firebase = Firebase::Client.new("https://popping-torch-6315.firebaseio.com/#{@host}/messages_conversation/new_message_#{@conversation.last.id}")
    firebase.push("", :name => current_user.first_name, :text => params[:body], :id => current_user.id)
    respond_to do |format|
      format.html do
        flash[:notice]= "Message Sent!"
        redirect_to conversation_message_path(@reply_message)
      end
      format.js do
        @messages = @message.conversation
      end
    end
  end

  def conversation
    @host = request.host
    @message = Message.find(params[:id])
    @conversation = @message.conversation
    @messages = @message.conversation
    firebase = Firebase::Client.new("https://popping-torch-6315.firebaseio.com/#{@host}/messages_conversation/new_message_#{@conversation.last.id}")
    firebase.delete("")
  end

  def fetch_conversation
    @message = Message.find(params[:id])
    @messages = @message.conversation
    render layout: false
  end

  def sent_messages
    @messages = current_user.sent_messages
  end
  
end