function scrollLastMessageIntoView() {
  const messages = document.querySelectorAll('.msg');
  const lastMessage = messages[messages.length - 1];
  lastMessage.scrollIntoView();
}
