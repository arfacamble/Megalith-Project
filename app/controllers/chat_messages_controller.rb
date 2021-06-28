class ChatMessagesController < ApplicationController
  def create
    @trip_chat_box = TripChatBox.find(params[:trip_chat_box_id])
    @chat_message = ChatMessage.new(chat_message_params)
    @chat_message.trip_chat_box = @trip_chat_box
    @chat_message.user = current_user
    if @chat_message.save
      redirect_to trip_path(@trip_chat_box.trip, anchor: "chat-anchor")
    else
      render "chatrooms/show"
    end
  end

  private

  def chat_message_params
    params.require(:chat_message).permit(:content)
  end
end
