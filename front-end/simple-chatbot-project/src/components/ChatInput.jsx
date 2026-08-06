import { useState } from "react";

function ChatInput({ onAdd }) {
	const [inputText, setInputText] = useState("");

	function handleSubmit(e) {
		e.preventDefault();
		if (!inputText) return;
		onAdd({ id: crypto.randomUUID(), sender: "user", message: inputText });
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
