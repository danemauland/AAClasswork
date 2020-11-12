import React from 'react';
import ReactDOM from 'react-dom';
import {login, logout, signup} from "./actions/sessions_actions";
import Root from "./components/root"
import configureStore from "./store/store.js"

document.addEventListener("DOMContentLoaded", () => {
    const store = configureStore();
    const root = document.getElementById("root");
    ReactDOM.render(<Root store={store}/>, root);

    window.getState = store.getState;
    window.dispatch = store.dispatch;
    window.$ = $;
    window.login = login;
    window.logout = logout;
    window.signup = signup;
});