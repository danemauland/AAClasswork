// export const requestAllPokemons = () => (dispatch) => (
//     APIUtil.fetchAllPokemons()
//         .then(pokemons => dispatch(receiveAllPokemons(pokemons)))
// )


const thunk = function({dispatch, getState }) {
    return function(next) {
        return function(action) {
            if (typeof action === 'function'){
                return action(dispatch, getState)
            }

            return next(action);
        }
    }
}


export default thunk;