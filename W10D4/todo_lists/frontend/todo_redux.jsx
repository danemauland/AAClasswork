import React from "react";
import ReactDOM from "react-dom";
import { Provider } from 'react-redux';
import configureStore from '../store/store'
import Root from '../components/root'
import allTodos from '../reducers/selectors'

import { receiveTodos, receiveTodo} from "../actions/todo_actions"
//testing

document.addEventListener("DOMContentLoaded", () => {
    const store = configureStore();
    ReactDOM.render(
        <Root store={store}/>,
        document.getElementById("content")
        );
    //testing
    window.store = store;
    window.receiveTodos = receiveTodos;
    window.receiveTodo = receiveTodo;
    window.allTodos = allTodos;
})
    