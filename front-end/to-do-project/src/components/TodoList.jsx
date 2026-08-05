import TodoItem from "./TodoItem";

export default function TodoList({ todos, setTodos }) {
	return (
		<ul>
			{todos.map((todo) => (
				<TodoItem
					id={todo.id}
					title={todo.title}
					setTodos={setTodos}
					key={todo.id}
				/>
			))}
		</ul>
	);
}
