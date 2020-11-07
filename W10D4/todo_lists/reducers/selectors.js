const allTodos = (state) => {
    const keys = Object.keys(state.todos);
    const todos = keys.map( (key) => { return state.todos[key] });
    return todos;
}

 export default allTodos;