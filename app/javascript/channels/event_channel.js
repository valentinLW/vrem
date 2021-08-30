import consumer from "./consumer";

const initEventCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.eventId;

    consumer.subscriptions.create({ channel: "EventChannel", id: id }, {
      received(data) {
        console.log(data)
        const { groups: { new_message_user } } = /data-user-id="(?<new_message_user>\d)"/.exec(data)
        const current_user = messagesContainer.dataset.currentUserId

        const last_message = messagesContainer.lastElementChild
        const last_message_user = last_message.dataset.userId

        if(current_user === new_message_user) {
          data = data.replace(/<i.*<\/i\>/, "")
        } else {
            data = data.replaceAll("my-message", "others-message")
            if (last_message_user === new_message_user) {
              const i = last_message.querySelector("i")
              i.parentElement.removeChild(i)
            }
          }

        messagesContainer.insertAdjacentHTML('beforeend', data);
        messagesContainer.lastElementChild.scrollIntoView();
      },
    });
  }
}

export { initEventCable };
