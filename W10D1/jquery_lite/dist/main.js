/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is not neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module */
/*! CommonJS bailout: module.exports is used directly at 107:0-14 */
/***/ ((module) => {

eval("function DOMNodeCollection (nodes) {\n    this.nodes = nodes;\n}\n\nDOMNodeCollection.prototype.html = function(str) {\n    if (str === undefined) {\n        return this.nodes[0].innerHTML;\n    } else {\n        this.nodes.forEach((ele) => {\n            ele.innerHTML = str;\n        })\n    }\n}\n\nDOMNodeCollection.prototype.empty = function() {\n    this.html(\"\");\n}\n\nDOMNodeCollection.prototype.append = function(arg) {\n    if (arg instanceof DOMNodeCollection) {\n        this.nodes.forEach((node) =>{\n            arg.nodes.forEach((node2) =>{\n                node.innerHTML += node2.outerHTML;\n            });\n        });\n    }\n    else if (typeof arg === 'string'){\n        this.nodes.forEach((node) =>{\n        node.innerHTML += arg;  \n        });\n    }\n    else {\n        this.nodes.forEach((node) =>{\n            node.innerHTML += arg.outerHTML;\n        });\n    }\n}\n\nDOMNodeCollection.prototype.attr = function(attr, value) {\n    if (value === undefined) return this.nodes[0].getAttribute(attr); \n    this.nodes.forEach((node) => {\n        node.setAttribute(attr, value);\n    });\n}\n\nDOMNodeCollection.prototype.addClass = function(classNew) {\n    this.nodes.forEach((node) =>{\n        node.classList.add(classNew);\n    });\n}\n\nDOMNodeCollection.prototype.removeClass = function(classNew) {\n    this.nodes.forEach((node) =>{\n        node.classList.remove(classNew);\n    });\n}\n\nDOMNodeCollection.prototype.children = function() {\n    let kids = [];\n    this.nodes.forEach((node) =>{\n        kids = kids.concat([].slice.apply(node.children));\n\n    });\n    return new DOMNodeCollection(kids.slice())\n}\n\nDOMNodeCollection.prototype.parent = function () {\n    let parentNodes = [];\n    this.nodes.forEach((node) => {\n        let parentNode = node.parentElement;\n        if (!parentNodes.includes(parentNode)) {\n            parentNodes.push(parentNode);\n        }\n    });\n    return new DOMNodeCollection(parentNodes);\n}\n\nDOMNodeCollection.prototype.find = function (selector){\n    let found = [];\n    this.nodes.forEach((node) =>{\n        found = found.concat([].slice.apply(node.querySelectorAll(selector)));\n\n    });\n    return new DOMNodeCollection(found.slice())\n}\n\nDOMNodeCollection.prototype.remove = function() {\n    this.nodes.forEach((node) =>{\n        node.remove();\n    });\n}\n\nDOMNodeCollection.prototype.on = function(action, callback) {\nthis.nodes.forEach((node) =>{\n    node.addEventListener(action, callback);\n    if (node[action] === undefined) {\n        node[action] = [callback];\n    } \n    else {\n        node[action].push(callback);\n    }\n    });\n\n}\n\n\nmodule.exports = DOMNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		if(__webpack_module_cache__[moduleId]) {
/******/ 			return __webpack_module_cache__[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
(() => {
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: __webpack_require__ */
eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection */ \"./src/dom_node_collection.js\");\n\nwindow.$l = function (arg) {\n    let nodeList;\n    if (arg instanceof HTMLElement) {\n        nodeList = [arg]\n    } else {\n        nodeList = document.querySelectorAll(arg);\n        nodeList = [].slice.call(nodeList);\n    }\n    const nodes = new DOMNodeCollection(nodeList);\n    return nodes;\n}\n\n\n\n//# sourceURL=webpack:///./src/index.js?");
})();

/******/ })()
;