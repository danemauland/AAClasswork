import React from "react";
import {Link} from "react-router-dom";
export default class SessionForm extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            username: "",
            password: "",
        }

        this.updateUsername = this.updateUsername.bind(this)
        this.updatePassword = this.updatePassword.bind(this)
        this.handleSubmit = this.handleSubmit.bind(this)
    }

    updateUsername(e) {
        this.setState({
            username: e.target.value
        })
    }

    updatePassword(e) {
        this.setState({
            password: e.target.value
        })
    }

    handleSubmit(e) {
        e.preventDefault();
        const user = Object.assign({}, this.state);
        this.props.processForm(user);
    }

    render() {
        return (
            <div>
                <h1>{this.props.formType === "login" ? "Log In" : "Sign Up"}</h1>
                <Link to={this.props.formType === "login" ? "signup" : "login"}>{this.props.formType === "login" ? "Sign up" : "Log in"}</Link>
                <ul>
                    {this.props.errors.map((error, i) => <li key={i}>{error}</li>)}
                </ul>
                <form>
                    <label>Username:
                        <input type="text" onChange={this.updateUsername} value={this.state.username}/>
                    </label>

                    <label>Password:
                        <input type="password" onChange={this.updatePassword} value={this.state.password}/>
                    </label>
                    <input type="submit" onClick={this.handleSubmit} value={this.props.formType === "login" ? "Log In" : "Sign Up"}/>
                </form>
            </div>
        )
    }
}