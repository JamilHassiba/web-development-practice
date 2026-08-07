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

	async function addChatMessage(chatMessage) {
		setChatMessages((currentChatMessages) => {
			return [...currentChatMessages, chatMessage];
		});
		displayLoadingMessage();
		await getRobotResponse(chatMessage.message);
	}

	function displayLoadingMessage() {
		setChatMessages((currentChatMessages) => {
			return [
				...currentChatMessages,
				{ id: crypto.randomUUID(), sender: "robot", message: "Loading..." },
			];
		});
	}

	async function getRobotResponse(inputMessage) {
		const response = await window.Chatbot.getResponseAsync(inputMessage);
		setChatMessages((currentChatMessages) => {
			return [
				...currentChatMessages.slice(0, -1),
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
			{chatMessages.length === 0 && (
				<div className="welcome-message">
					Welcome to the chatbot project! Send a message using the textbox
					below.
				</div>
			)}
			<ChatMessages
				chatMessages={chatMessages}
				chatMessagesRef={chatMessagesRef}
			/>
			<ChatInput onAdd={addChatMessage} onDelete={deleteChatMessages} />
		</div>
	);
}

export default App;
