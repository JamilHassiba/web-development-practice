import "./App.css";

function App() {
	return (
		<>
			<form>
				<label htmlFor="newItem">New Item</label>
				<input type="text" id="newItem" />
				<button type="submit">Add</button>
			</form>
			<h1>Todo List</h1>
			<ul>
				<li>
					<input type="checkbox" id="item" />
					<label htmlFor="item">Item 1</label>
					<button type="button">Delete</button>
				</li>
			</ul>
		</>
	);
}

export default App;
