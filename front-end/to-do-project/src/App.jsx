import { useEffect, useState } from "react";
import "./App.css";
import NewItemForm from "./components/NewItemForm";
import TodoList from "./components/TodoList";

function App() {
	const [todos, setTodos] = useState(() => {
		const data = localStorage.getItem("todos");
		return data ? JSON.parse(data) : [];
	});

	useEffect(() => {
		localStorage.setItem("todos", JSON.stringify(todos));
	}, [todos]);

	function addTodo(title) {
		setTodos((currentTodos) => [
			...currentTodos,
			{ id: crypto.randomUUID(), title },
		]);
	}

	function deleteTodo(id) {
		setTodos((currentTodos) => currentTodos.filter((todo) => todo.id !== id));
	}

	return (
		<>
			<NewItemForm onAdd={addTodo} />
			<h1>Todo List</h1>
			{todos.length === 0 && "No Todos"}
			<TodoList todos={todos} onDelete={deleteTodo} />
		</>
	);
}

export default App;
