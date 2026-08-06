import { useEffect, useRef, useState } from "react";
import "./App.css";
import ChatInput from "./components/ChatInput";
import ChatMessages from "./components/ChatMessages";

function App() {
	const [chatMessages, setChatMessages] = useState(() => {
		const data = localStorage.getItem("messages");
		return data ? JSON.parse(data) : [];
	});

	useEffect(() => {
		localStorage.setItem("messages", JSON.stringify(chatMessages));
	}, [chatMessages]);

	const chatMessagesRef = useRef(null);

	useEffect(() => {
		if (chatMessages.length === 0) return;
		const messagesContainerElem = chatMessagesRef.current;
		if (messagesContainerElem) {
			messagesContainerElem.scrollTop = messagesContainerElem.scrollHeight;
		}
	}, [chatMessages]);

	function addChatMessage(chatMessage) {
		setChatMessages((currentChatMessages) => {
			return [...currentChatMessages, chatMessage];
		});
		getRobotResponse(chatMessage.message);
	}

	function getRobotResponse(inputMessage) {
		const response = window.Chatbot.getResponse(inputMessage);
		setChatMessages((currentChatMessages) => {
			return [
				...currentChatMessages,
				{ id: crypto.randomUUID(), sender: "robot", message: response },
			];
		});
	}

	function deleteChatMessages() {
		setChatMessages([]);
		localStorage.setItem("messages", []);
	}

	return (
		<div className="app-container">
			<ChatMessages
				chatMessages={chatMessages}
				chatMessagesRef={chatMessagesRef}
			/>
			<ChatInput onAdd={addChatMessage} onDelete={deleteChatMessages} />
		</div>
	);
}

export default App;
