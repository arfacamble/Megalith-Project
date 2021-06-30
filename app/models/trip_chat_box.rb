class TripChatBox < ApplicationRecord
  belongs_to :trip
  has_many :chat_messages
end
