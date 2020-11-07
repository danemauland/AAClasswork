import React from "react";

export default class Weather extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            city: null,
            temp: null
        }
        this.updateCityAndTemp = this.updateCityAndTemp.bind(this);
        this.getWeather = this.getWeather.bind(this);
    }

    componentDidMount() {
        const weather = navigator.geolocation.getCurrentPosition(this.getWeather);
        console.log(weather)
    }

    getWeather(location) {
        const lat = location.coords.latitude;
        const lon = location.coords.longitude;
        const link =
          `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=2c024e1df1da8cedb8d2c04fe3a0a4a9&units=imperial`;
        const request = new XMLHttpRequest();
        request.open('GET', link, true);

        request.onload = function() {
          if (request.status >= 200 && request.status < 400) {
            // Success!
            const resp = JSON.parse(request.response);
            const city = resp.name;
            const temp = resp.main.temp;
            this.setState({
                city,
                temp
            });
          } else {
            // We reached our target server, but it returned an error       
          }
        }.bind(this);

        request.onerror = function() {
          // There was a connection error of some sort
        };

        request.send();
    }

    updateCityAndTemp(city, temp) {
        
    }

    render() {
        debugger;
        return (
          <div>
            <p>{this.state.city}</p>
            <p>{this.state.temp}</p>
          </div>
        );
    }
}

