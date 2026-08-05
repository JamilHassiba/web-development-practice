import { useState } from "react";
import "./App.css";
import NewItemForm from "./components/NewItemForm";
import TodoList from "./components/TodoList";

function App() {
	const [todos, setTodos] = useState([]);

	return (
		<>
			<NewItemForm setTodos={setTodos} />
			<h1>Todo List</h1>
			{todos.length === 0 && "No Todos"}
			<TodoList todos={todos} setTodos={setTodos} />
		</>
	);
}

export default App;
