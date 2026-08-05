export default function TodoItem({ todo, onToggle, onDelete }) {
	return (
		<li className="todo-item">
			<label className={todo.checked ? "checked" : ""}>
				<input
					type="checkbox"
					checked={todo.checked}
					onChange={() => onToggle(todo.id)}
				/>
				{todo.title}
			</label>
			<button onClick={() => onDelete(todo.id)} type="button">
				Delete
			</button>
		</li>
	);
}
