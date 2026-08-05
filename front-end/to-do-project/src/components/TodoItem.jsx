export default function TodoItem({ todo, onDelete }) {
	return (
		<li>
			<label>
				<input type="checkbox" />
				{todo.title}
			</label>
			<button onClick={() => onDelete(todo.id)} type="button">
				Delete
			</button>
		</li>
	);
}
