import { useState } from "react";
import "./App.css";
import ChatInput from "./components/ChatInput";

function App() {
	const [chatMessages, setChatMessages] = useState(() => {
		const data = localStorage.getItem("messages");
		return data ? JSON.parse(data) : [];
	});

	return (
		<>
			<ChatMessages chatMessages={chatMessages} />
			<ChatInput />
		</>
	);
}

export default App;
