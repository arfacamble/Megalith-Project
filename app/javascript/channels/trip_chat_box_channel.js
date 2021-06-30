import consumer from "./consumer";

const initTripChatBoxCable = () => {
  const messagesContainer = document.querySelector('.chat-messages-container');
  if (messagesContainer) {
    const id = messagesContainer.dataset.tripChatBoxId;

    consumer.subscriptions.create({ channel: "TripChatBoxChannel", id: id }, {
      received(data) {
        const myMessageForOthers = data.replace(' flex-row-reverse margin-left-auto', '');
        messagesContainer.insertAdjacentHTML('afterBegin', myMessageForOthers);
      },
    });
  }
}

export { initTripChatBoxCable };
