import {RECEIVE_ALL_POKEMONS} from '../actions/pokemon_actions'

const pokemonReducer = (state = {}, action) => {

    switch(action.type) {
        case RECEIVE_ALL_POKEMONS:
            const newState = Object.assign({}, state, action.pokemons); //Ques for Ta deepdup
            return newState;
        default:
            return state;

    }

}

export default pokemonReducer;