function DOMNodeCollection (nodes) {
    this.nodes = nodes;
}

DOMNodeCollection.prototype.html = function(str) {
    if (str === undefined) {
        return this.nodes[0].innerHTML;
    } else {
        this.nodes.forEach((ele) => {
            ele.innerHTML = str;
        })
    }
}

DOMNodeCollection.prototype.empty = function() {
    this.html("");
}

DOMNodeCollection.prototype.append = function(arg) {
    if (arg instanceof DOMNodeCollection) {
        this.nodes.forEach((node) =>{
            arg.nodes.forEach((node2) =>{
                node.innerHTML += node2.outerHTML;
            });
        });
    }
    else if (typeof arg === 'string'){
        this.nodes.forEach((node) =>{
        node.innerHTML += arg;  
        });
    }
    else {
        this.nodes.forEach((node) =>{
            node.innerHTML += arg.outerHTML;
        });
    }
}

DOMNodeCollection.prototype.attr = function(attr, value) {
    if (value === undefined) return this.nodes[0].getAttribute(attr); 
    this.nodes.forEach((node) => {
        node.setAttribute(attr, value);
    });
}

DOMNodeCollection.prototype.addClass = function(classNew) {
    this.nodes.forEach((node) =>{
        node.classList.add(classNew);
    });
}

DOMNodeCollection.prototype.removeClass = function(classNew) {
    this.nodes.forEach((node) =>{
        node.classList.remove(classNew);
    });
}

DOMNodeCollection.prototype.children = function() {
    let kids = [];
    this.nodes.forEach((node) =>{
        kids = kids.concat([].slice.apply(node.children));

    });
    return new DOMNodeCollection(kids.slice())
}

DOMNodeCollection.prototype.parent = function () {
    let parentNodes = [];
    this.nodes.forEach((node) => {
        let parentNode = node.parentElement;
        if (!parentNodes.includes(parentNode)) {
            parentNodes.push(parentNode);
        }
    });
    return new DOMNodeCollection(parentNodes);
}

DOMNodeCollection.prototype.find = function (selector){
    let found = [];
    this.nodes.forEach((node) =>{
        found = found.concat([].slice.apply(node.querySelectorAll(selector)));

    });
    return new DOMNodeCollection(found.slice())
}

DOMNodeCollection.prototype.remove = function() {
    this.nodes.forEach((node) =>{
        node.remove();
    });
}

DOMNodeCollection.prototype.on = function(action, callback) {
this.nodes.forEach((node) =>{
    node.addEventListener(action, callback);
    if (node[action] === undefined) {
        node[action] = [callback];
    } 
    else {
        node[action].push(callback);
    }
    });

}


module.exports = DOMNodeCollection;