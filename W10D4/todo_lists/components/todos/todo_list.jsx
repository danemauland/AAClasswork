import React from "react";
import TodoListItem from "./todo_list_item";
import TodoForm from "./todo_form"
export default (props) => (
    <div>
        <ul>
            { 
                Object.keys(props.todos).map(key => {
                    const todo = props.todos[key];
                return <TodoListItem key={key} todo={todo}/>
                })
            }  
        </ul>

        <TodoForm todos={props.todos} action={props.receiveTodo}/>
    </div>
)