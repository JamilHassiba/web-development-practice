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
				<button
					className={`primary-button send-button ${!inputText || isLoading ? "unavailable" : ""}`}
					type="submit"
				>
					Send
				</button>
			</form>
			<button className={`secondary-button`} onClick={onDelete} type="button">
				Clear
			</button>
		</div>
	);
}

export default ChatInput;
