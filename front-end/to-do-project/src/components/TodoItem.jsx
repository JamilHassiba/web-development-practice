export default function TodoItem({ id, title, setTodos }) {
	function deleteTodo(id) {
		setTodos((currentTodos) => currentTodos.filter((todo) => todo.id !== id));
	}

	return (
		<li>
			<label>
				<input type="checkbox" />
				{title}
			</label>
			<button onClick={() => deleteTodo(id)} type="button">
				Delete
			</button>
		</li>
	);
}
