import React from "react";

class Clock extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            time: new Date(),
        }
        this.tick = this.tick.bind(this);
    };

    tick() {
        this.setState( {
            time: new Date()
        })
    }

    componentDidMount() {
        this.interval = window.setInterval(this.tick, 1000);
    }

    componentWillUnmount() {
        window.clearInterval(this.interval)
    }

    render() {
        return (
            <div>
                <h1>Clock</h1>
                <p>{this.state.time.toTimeString()}</p>   
            </div>
        );
    }
}

export default Clock;