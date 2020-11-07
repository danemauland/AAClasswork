import React from "react";

export default (props) => {
    return <li key={props.todo.id}> {props.todo.title} </li>
}
