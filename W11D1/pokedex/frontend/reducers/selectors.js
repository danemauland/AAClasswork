
const selectAllPokemon = (state) => {
    const pokemons = [];
    Object.values(state.entities.pokemon).forEach((pokemon) => pokemons.push(pokemon));
    return pokemons;
}

export default selectAllPokemon;