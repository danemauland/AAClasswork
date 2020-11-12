const RECEIVE_SESSION_ERRORS = "RECEIVE_SESSION_ERRORS";
import {RECEIVE_CURRENT_USER} from "../actions/sessions_actions";

const defaultSessionErrors = []

const sessionErrorsReducer = (state = defaultSessionErrors, action) => {
    Object.freeze(state);
    let errors;
    debugger
    switch (action.type) {
        case RECEIVE_SESSION_ERRORS:
            debugger
            return action.errors
        case RECEIVE_CURRENT_USER:
            return [];
        default:
            return state;
    }
}

export default sessionErrorsReducer;