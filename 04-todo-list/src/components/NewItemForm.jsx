import { useState } from "react";

export default function NewItemForm({ onAdd }) {
	const [newItem, setNewItem] = useState("");

	function handleSubmit(e) {
		e.preventDefault();
		onAdd(newItem);
		setNewItem("");
	}

	return (
		<form className="form-container" onSubmit={handleSubmit}>
			<label htmlFor="newItem">New Item</label>
			<input
				value={newItem}
				type="text"
				id="newItem"
				autoComplete="off"
				onChange={(e) => setNewItem(e.target.value)}
			/>
			<button type="submit">Add</button>
		</form>
	);
}
