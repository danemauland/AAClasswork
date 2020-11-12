import React from "react";
import {Link} from "react-router-dom";
export default class Greeting extends React.Component {
    constructor(props) {
        super(props);
        this.handleLogout = this.handleLogout.bind(this)
    }

    handleLogout(e) {
        e.preventDefault();
        this.props.logout();
    }

    render() {
        if (this.props.currentUser) {
            return (
                <div>
                    <p>Welcome!</p>
                    <button onClick={this.handleLogout}>Logout</button>
                </div>
            )
        } else {
            return (
                <div>
                    <Link to="/signup">Sign Up </Link>
                    <Link to="/login">Log In </Link>
                </div>
            )
        }

    }
}