import React from "react";
import GreetingContainer from "./greeting_container";
import LoginFormContainer from "./login_form_container";
import SignupFormContainer from "./signup_form_container";
import {Route} from "react-router-dom";

export default () => {
    return (
        <div>
            <header>
                <h1>Bench BnB</h1>
                <GreetingContainer />
            </header>
            <Route path="/login" component={LoginFormContainer} />
            <Route path="/signup" component={SignupFormContainer} />
        </div>
    )
}