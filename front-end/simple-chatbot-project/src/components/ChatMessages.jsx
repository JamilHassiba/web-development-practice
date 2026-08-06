import ChatMessage from "./ChatMessage";

function ChatMessages(chatMessages) {
	return chatMessages.map((chatMessage) => (
		<ChatMessage key={chatMessage.id} {...chatMessage} />
	));
}

export default ChatMessages;
