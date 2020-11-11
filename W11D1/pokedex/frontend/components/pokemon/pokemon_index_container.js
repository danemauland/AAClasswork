import {connect} from 'react-redux';
import requestAllPokemons from '../../actions'

const mapStateToProps = state => {
    return {
        pokemons: state.entities.pokemon
    }
}

const mapDispatchToProps = dispatch => {
    return {
        requestAllPokemons:(() => dispatch(requestAllPokemons()))
    }
    
    componentDidMount() {
        this.props.requestAllPokemons()
    }
}

export default connect(mapStateToProps, mapDispatchToProps)()