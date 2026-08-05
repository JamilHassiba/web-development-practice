export default function TodoItem({ todo, onToggle, onDelete }) {
	return (
		<li>
			<label>
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
