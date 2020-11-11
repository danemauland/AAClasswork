const RECEIVE_ALL_POKEMONS = "RECEIVE_ALL_POKEMONS";
const RECEIVE_POKEMON = "RECEIVE_POKEMON";
const DELETE_POKEMON = "DELETE_POKEMON";
const UPDATE_POKEMON = "UPDATE_POKEMON";

export const fetchAllPokemons = () => {

    return $.ajax({
        url: "/api/pokemon",
        method: "GET"    
    })
}