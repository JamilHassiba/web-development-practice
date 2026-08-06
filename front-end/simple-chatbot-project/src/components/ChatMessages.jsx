import ChatMessage from "./ChatMessage";

function ChatMessages({ chatMessages, chatMessagesRef }) {
	return (
		<div className="messages-container" ref={chatMessagesRef}>
			{chatMessages.map((chatMessage) => (
				<ChatMessage key={chatMessage.id} {...chatMessage} />
			))}
		</div>
	);
}

export default ChatMessages;
