import { useState } from "react";

export default function NewItemForm({ onAdd }) {
	const [newItem, setNewItem] = useState("");

	function handleSubmit(e) {
		e.preventDefault();
		onAdd(newItem);
		setNewItem("");
	}

	return (
		<form onSubmit={handleSubmit}>
			<label htmlFor="newItem">New Item</label>
			<input
				value={newItem}
				onChange={(e) => setNewItem(e.target.value)}
				type="text"
				id="newItem"
			/>
			<button type="submit">Add</button>
		</form>
	);
}
