import React from "react";
import ReactDOM from 'react-dom';
import Clock from "./frontend/clock";
import Tabs from "./frontend/tabs";
import Weather from "./frontend/weather";

// declare an array of objs
let tabs = [
    {title: "one", content: "first pane here"}, 
    {title: "two", content: "second pane here"}, 
    {title: "three", content: "third pane here"}
]

document.addEventListener("DOMContentLoaded", () => {
    const main = document.getElementById("main")
    const Root = () => <div>
        <Clock />
        <Tabs whatever={tabs}/>
        <Weather />
    </div>;
    ReactDOM.render(<Root />, main);
})