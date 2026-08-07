import { useState } from "react";

function ChatInput({ onAdd, onDelete }) {
	const [inputText, setInputText] = useState("");
	const [isLoading, setIsLoading] = useState(false);

	async function handleSubmit(e) {
		e.preventDefault();
		if (!inputText) return;
		if (isLoading) return;

		const currentInput = inputText;
		setInputText("");
		setIsLoading(true);
		await onAdd({
			id: crypto.randomUUID(),
			sender: "user",
			message: currentInput,
		});
		setIsLoading(false);
	}

	return (
		<div className="input-container">
			<form onSubmit={handleSubmit}>
				<input
					value={inputText}
					type="text"
					autoComplete="off"
					placeholder="Write a message..."
					onChange={(e) => setInputText(e.target.value)}
				/>
				<button className="send-button" type="submit">
					Send
				</button>
			</form>
			<button className="clear-button" onClick={onDelete} type="button">
				Clear Chat
			</button>
		</div>
	);
}

export default ChatInput;
