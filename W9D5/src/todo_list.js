const todos = (JSON.parse(localStorage.getItem("todos")) || []);
const ul = document.querySelector("ul.todos");

const addTodo = (e) => {
    e.preventDefault();
    input = document.querySelector('input[name="add-todo"]');
    todoText = input.value;
    todo = {
        value: todoText,
        done: false
    }
    todos.push(todo);
    input.value = "";
    populateList();
    localStorage.setItem("todos", JSON.stringify(todos));
}

const populateList = () => {
    while (ul.firstChild) {
        ul.removeChild(ul.firstChild)
    }
    todos.forEach(ele => {
        let li = document.createElement("li");
        let label = document.createElement("label");
        let checkBox = document.createElement("input");
        checkBox.setAttribute("type","checkbox");
        checkBox.checked = (ele.done ? true : false);
        label.textContent = ele.value;
        label.append(checkBox);
        li.append(label);
        ul.append(li);
    })
}

const toggleDone = (e) => {
    console.log("test");
    if (!e.target.matches("input")) {return}
    let text = e.target.parentElement.textContent;
    todos.forEach( (todo) => {
        if (todo.value === text) {
            todo.done = !todo.done;
        }
    })
    localStorage.setItem("todos", JSON.stringify(todos));
    populateList()
}

form = document.querySelector("form.add-todo-form");
form.addEventListener("submit", addTodo);
ul.addEventListener("click", toggleDone);
populateList();