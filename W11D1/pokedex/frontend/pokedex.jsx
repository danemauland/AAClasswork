import React from "react"
import ReactDOM from "react-dom"
import {receiveAllPokemons, requestAllPokemons} from "./actions/pokemon_actions"
import {fetchAllPokemons} from "./util/api_util"
import configureStore from './store/store'
import selectAllPokemons from './reducers/selectors'
import Root from './components/root'

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    const store = configureStore();
    ReactDOM.render(<Root store={store} />, root);

    window.receiveAllPokemons = receiveAllPokemons;
    window.requestAllPokemons = requestAllPokemons;
    window.fetchAllPokemons = fetchAllPokemons;
    window.selectAllPokemons = selectAllPokemons;
    window.getState = store.getState;
    window.dispatch = store.dispatch;
})

