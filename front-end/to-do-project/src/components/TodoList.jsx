import TodoItem from "./TodoItem";

export default function TodoList({ todos, onToggle, onDelete }) {
	return (
		<ul className="todo-list">
			{todos.length === 0 && "No Todos"}
			{todos.map((todo) => (
				<TodoItem
					key={todo.id}
					todo={todo}
					onToggle={onToggle}
					onDelete={onDelete}
				/>
			))}
		</ul>
	);
}
