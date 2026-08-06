import { useEffect, useState } from "react";
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

	function addChatMessage(chatMessage) {
		setChatMessages((currentChatMessages) => {
			return [...currentChatMessages, chatMessage];
		});
	}

	return (
		<>
			<ChatMessages chatMessages={chatMessages} />
			<ChatInput onAdd={addChatMessage} />
		</>
	);
}

export default App;
