import React from "react";

export default class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      index: 0,
    };
    this.updateIndex = this.updateIndex.bind(this);
  }

  updateIndex(event) {
      const i = parseInt(event.target.parentElement.getAttribute("data-id"));
      this.setState({
          index: i
      })
  }

  render() {
    return (
      <ul>
        {this.props.whatever.map((ele, i) => (
          <li key={i} data-id={i}>
            <h1 onClick={this.updateIndex}>{ele.title}</h1>
            <article>{i === this.state.index ? ele.content : ""}</article>
          </li>
        ))}
      </ul>
    );
  }
}

