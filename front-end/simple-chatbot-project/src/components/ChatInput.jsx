import { useState } from "react";

function ChatInput() {
	const [inputText, setInputText] = useState("");

	function handleSubmit() {
		e.preventDefault();
		// TODO: Add a chat message to chat list //
		setInputText("");
	}

	return (
		<form onSubmit={handleSubmit}>
			<input
				value={inputText}
				type="text"
				autoComplete="off"
				placeholder="Write a message..."
				onChange={(e) => setInputText(e.target.value)}
			/>
			<button type="submit">Send</button>
		</form>
	);
}

export default ChatInput;
