import * as SessionAPIUtil from "../util/session_api_util";

export const login = user => {
    return dispatch => {
        return SessionAPIUtil.login(user).then(currentUser => {
            return dispatch(receiveCurrentUser(currentUser))
        }, errors => {
            return dispatch(receiveErrors(errors.responseJSON));
        });
    };
};

export const signup = user => {
    return dispatch => {
        return SessionAPIUtil.signup(user).then(currentUser => {
            return dispatch(receiveCurrentUser(currentUser))
        }, err => {
            return dispatch(receiveErrors(err.responseJSON));
        });
    };
};

export const logout = () => {
    return dispatch => {
        return SessionAPIUtil.logout().then(currentUser => {
            return dispatch(logoutCurrentUser(currentUser))
        }, errors => {
            return dispatch(receiveErrors(errors.responseJSON));
        });
    };
};

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';

export const receiveCurrentUser = currentUser =>{
    return {
    type: RECEIVE_CURRENT_USER,
    currentUser 
}};

export const logoutCurrentUser = () => ({
    type: LOGOUT_CURRENT_USER,
});

export const receiveErrors = errors => {
    return {
    type: RECEIVE_SESSION_ERRORS,
    errors
    }
}

