export const RECEIVE_ALL_POKEMONS = "RECEIVE_ALL_POKEMONS";
export const RECEIVE_POKEMON = "RECEIVE_POKEMON";
export const DELETE_POKEMON = "DELETE_POKEMON";
export const UPDATE_POKEMON = "UPDATE_POKEMON";
import * as APIUtil from '../util/api_util';

export const receiveAllPokemons = (pokemons) => {
    return ({
        type: RECEIVE_ALL_POKEMONS,
        pokemons: pokemons,
    })
}

export const requestAllPokemons = () => (dispatch) => (
    APIUtil.fetchAllPokemons()
        .then(pokemons => dispatch(receiveAllPokemons(pokemons)))
)