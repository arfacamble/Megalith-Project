import consumer from "./consumer";

const initTripChatBoxCable = () => {
  const messagesContainer = document.querySelector('.chat-messages-container');
  if (messagesContainer) {
    const id = messagesContainer.dataset.tripChatBoxId;

    consumer.subscriptions.create({ channel: "TripChatBoxChannel", id: id }, {
      received(data) {
        consumer.subscriptions.create({ channel: "TripChatBoxChannel", id: id }, {
          received(data) {
            messagesContainer.insertAdjacentHTML('afterBegin', data);
          }
        });
      },
    });
  }
}

export { initTripChatBoxCable };
