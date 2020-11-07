import React from "react";
import todosReducer from "../../reducers/todos_reducer";
export default class TodoForm extends React.Component{
    constructor(props){
        super(props)
        this.state = {id: "", title: "", body: "", done: false}

        this.updateTitle = this.updateTitle.bind(this);
        this.updateBody = this.updateBody.bind(this);
        this.submitTodo = this.submitTodo.bind(this);
    }

    updateTitle(e){
        this.setState({title: e.currentTarget.value})
    }
    updateBody(e){
        this.setState({body: e.currentTarget.value})
    }

    submitTodo(e){
        e.preventDefault();
        const newTodo = Object.assign({},this.state);
        newTodo.id = new Date().getTime();
        this.setState({ id: "", title: "", body: "", done: false });
        this.props.action(newTodo);
    }

    render() {
        return (
            <form>
            <label>Title
                <input type="text" onChange={this.updateTitle} value={this.state.title}/>
            </label>

            <label>Body
                <textarea onChange={this.updateBody} value={this.state.body} />
            </label>

            <button onClick={this.submitTodo}> Submit</button>

            </form>
        )
    }
}

