const DOMNodeCollection = require("./dom_node_collection");

window.$l = function (arg) {
    let nodeList;
    if (arg instanceof HTMLElement) {
        nodeList = [arg]
    } else {
        nodeList = document.querySelectorAll(arg);
        nodeList = [].slice.call(nodeList);
    }
    const nodes = new DOMNodeCollection(nodeList);
    return nodes;
}

