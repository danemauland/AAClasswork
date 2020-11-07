import { RECEIVE_TODOS, RECEIVE_TODO} from "../actions/todo_actions"
import {merge} from "lodash";

const initialState = {
    1: {
        id: 1,
        title: "wash car",
        body: "with soap",
        done: false
    },
    2: {
        id: 2,
        title: "wash dog",
        body: "with shampoo",
        done: true
    }
};

const todosReducer = (state = initialState, action) => {
    debugger;
    Object.freeze(state);
    switch (action.type) {
        case RECEIVE_TODOS:
            const todoObject = {};
            action.todos.forEach((ele) => {
                const id = ele.id;
                
                todoObject[id] = ele
            })
            return todoObject;
        case RECEIVE_TODO:
            const newTodo = {[action.todo.id]: action.todo };
            debugger;
            return merge({}, state, newTodo);
        default:
            return state;
    }
};

export default todosReducer;