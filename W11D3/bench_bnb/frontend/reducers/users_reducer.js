import {RECEIVE_CURRENT_USER} from "../actions/sessions_actions"

const defaultUser = {}

const usersReducer = (state = defaultUser, action) => {
    Object.freeze(state);
    switch (action.type) {
        case RECEIVE_CURRENT_USER:
            return Object.assign({}, state, {[action.currentUser.id]: action.currentUser});
        default:
            return state;
    }
}

export default usersReducer;