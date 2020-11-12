import * as SessionAPIUtil from "../util/session_api_util";

export const login = user => {
    return dispatch => {
        return SessionAPIUtil.login(user).then(currentUser => {
            return dispatch(receiveCurrentUser(currentUser))
        }, errors => {
            return receiveErrors(errors);
        });
    };
};

export const signup = user => {
    return dispatch => {
        return SessionAPIUtil.signup(user).then(currentUser => {
            return dispatch(logoutCurrentUser(currentUser))
        }, errors => {
            return receiveErrors(errors);
        });
    };
};

export const logout = () => {
    return dispatch => {
        return SessionAPIUtil.logout().then(currentUser => {
            return dispatch(logoutCurrentUser(currentUser))
        }, errors => {
            return receiveErrors(errors);
        });
    };
};

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';

export const receiveCurrentUser = currentUser => ({
    type: RECEIVE_CURRENT_USER,
    user: currentUser 
});

export const logoutCurrentUser = () => ({
    type: LOGOUT_CURRENT_USER,
    user: null
});

export const receiveErrors = errors => ({
    type: RECEIVE_ERRORS,
    errors
})

