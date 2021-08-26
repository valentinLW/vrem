import consumer from "./consumer";

const initEventCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.eventId;

    consumer.subscriptions.create({ channel: "EventChannel", id: id }, {
      received(data) {
        const { groups: { user_id } } = /data-user-id="(?<user_id>\d)"/.exec(data)

        const last_message = document.getElementById("messages").lastElementChild
        const last_user_id = last_message.dataset.userId
        const remove = last_user_id === user_id
        if (remove) {
          const i = last_message.querySelector("i")
          i.parentElement.removeChild(i)
        }

        messagesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initEventCable };
