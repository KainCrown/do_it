class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    if @message.save!
      send_message('/chat')
    end
    render :nothing => true
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def send_message(dialog_name)
    PrivatePub.publish_to(
      dialog_name,
      message: render_message
    )
  end

  def render_message
    render_to_string template: 'messages/_message', locals: { message: @message }, layout: false
  end
end
