import "./App.css";
import ChatInput from "./components/ChatInput";
import ChatMessage from "./components/ChatMessage";

function App() {
	return (
		<>
			<ChatMessage sender="user" message="Hi" />
			<ChatMessage sender="robot" message="Hello there! How can I help you?" />
			<ChatInput />
		</>
	);
}

export default App;
