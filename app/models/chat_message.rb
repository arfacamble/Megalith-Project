class ChatMessage < ApplicationRecord
  belongs_to :trip_chat_box
  belongs_to :user
end
