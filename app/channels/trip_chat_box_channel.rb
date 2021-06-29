class TripChatBoxChannel < ApplicationCable::Channel
  def subscribed
    trip_chat_box = TripChatBox.find(params[:id])
    stream_for trip_chat_box
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
