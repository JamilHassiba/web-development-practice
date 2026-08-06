import ChatMessage from "./ChatMessage";

function ChatMessages({ chatMessages }) {
	return (
		<div className="messages-container">
			{chatMessages.map((chatMessage) => (
				<ChatMessage key={chatMessage.id} {...chatMessage} />
			))}
		</div>
	);
}

export default ChatMessages;
