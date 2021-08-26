import consumer from "./consumer";

const initEventCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.eventId;

    consumer.subscriptions.create({ channel: "EventChannel", id: id }, {
      received(data) {
        const { groups: { user_id } } = /data-user-id="(?<user_id>\d)"/.exec(data)
        const current_user_id = document.getElementById("messages").dataset.currentUserId

        const last_message = document.getElementById("messages").lastElementChild
        const last_user_id = last_message.dataset.userId
        const remove = last_user_id === user_id
        if (remove) {
          const i = last_message.querySelector("i")
          i.parentElement.removeChild(i)
        }

        if(current_user_id !== user_id) {
          data = data.replaceAll("my-message", "others-message")
        }

        messagesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initEventCable };
