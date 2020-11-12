import { RECEIVE_CURRENT_USER,
         LOGOUT_CURRENT_USER} from '../actions/sessions_actions';

const defaultSession = {id: null};
Object.freeze(defaultSession);

const sessionReducer = (state = defaultSession, action) => {
    Object.freeze(state);
    switch (action.type) {
        case RECEIVE_CURRENT_USER:
            const newState = {id: action.currentUser.id};
            return Object.assign({}, state, newState);
        case LOGOUT_CURRENT_USER:
            return Object.assign({}, defaultSession);
        default:
            return state;
    }
}

export default sessionReducer;