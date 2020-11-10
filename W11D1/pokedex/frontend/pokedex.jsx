import React from "react"
import ReactDOM from "react-dom"

const Test = () => {
    return <h1>Pokedex</h1>
}

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    ReactDOM.render(<Test />, root);
})