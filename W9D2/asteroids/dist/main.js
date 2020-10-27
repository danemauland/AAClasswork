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

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module, __webpack_require__ */
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("// Spacerock. It inherits from MovingObject.\n\nconst MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Ship = __webpack_require__(/*! ./ship */ \"./src/ship.js\");\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\n\n\nfunction Asteroid(args) {\n    args = {\n    pos: args[\"pos\"],\n    color: Asteroid.COLOR,\n    radius: Asteroid.RADIUS,\n    vel: Util.randomVec(Asteroid.SCALAR),\n    game: args[\"game\"]\n    };\n    MovingObject.call(this, args);\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\nAsteroid.prototype.collideWith = function (otherObject) {\n    if (otherObject instanceof Ship) {\n        otherObject.relocate();\n    } else {\n        this.game.remove(this);\n        this.game.remove(otherObject);\n    }\n}\n\nAsteroid.COLOR = 'Red';\nAsteroid.RADIUS = 10;\nAsteroid.SCALAR = 1;\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/bullet.js":
/*!***********************!*\
  !*** ./src/bullet.js ***!
  \***********************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module, __webpack_require__ */
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\n//Kill spacerocks with this. Also a MovingObject subclass.\nfunction Bullet(args) {\n    args = {\n        pos: args[\"pos\"],\n        color: \"Black\",\n        radius: 10,\n        vel: args[\"vel\"],\n        game: args[\"game\"]\n    };\n    MovingObject.call(this, args);\n}\n\nUtil.inherits(Bullet, MovingObject);\n\n//MovingObject\nmodule.exports = Bullet;\n\n//# sourceURL=webpack:///./src/bullet.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module, __webpack_require__ */
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("//Holds collections of the asteroids, bullets, and your ship.\n// Keeps track of dimensions of the space; \n//wraps objects around when they drift off the screen.\n\nconst Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nconst Ship = __webpack_require__(/*! ./ship */ \"./src/ship.js\");\nconst Bullet = __webpack_require__(/*! ./bullet */ \"./src/bullet.js\");\n\nfunction Game() {\n    this.asteroids = [];\n    this.addAsteroids();\n    this.ship = new Ship({pos: this.randomPosition(), game: this});\n    this.bullets = [];\n}\n\nGame.DIM_X = 500;\nGame.DIM_Y = 500; \nGame.NUM_ASTEROIDS = 6;\n// \"Game.prototype.step\" method calls \"Game.prototype.move\" on all the objects\nGame.prototype.step = function(ctx) {\n    this.moveObjects(ctx);\n    this.checkCollisions();\n}\n\n\n// Game.prototype.checkCollisions checks for colliding objects.\nGame.prototype.checkCollisions = function () {\n    for (let i = 0; i < this.allObjects().length - 1; i++) {\n        for (let j = i + 1; j < this.allObjects().length; j++) {\n            if (this.allObjects()[i].isCollidedWith(this.allObjects()[j])){\n                this.allObjects()[i].collideWith(this.allObjects()[j])\n            };\n        }\n    }\n    \n}\n\n// Game.prototype.draw(ctx) draws th e game.\nGame.prototype.draw = function (ctx) {\n    ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);\n    for (let item of this.allObjects()) {\n        item.draw(ctx);\n    }\n}\n\nGame.prototype.moveObjects = function (ctx) {\n    for (let item of this.allObjects()) {\n        item.move();\n    }\n}\n\nGame.prototype.addAsteroids = function() {\n    for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {\n        this.add(new Asteroid({pos: this.randomPosition(), game: this}));    \n    }\n}\n\nGame.prototype.remove = function(obj) {\n    if (obj instanceof Asteroid) { \n        let index = this.asteroids.indexOf(obj);\n        this.asteroids.splice(index,1);\n    } else if (obj instanceof Bullet) {\n        let index = this.bullets.indexOf(obj);\n        this.bullets.splice(index, 1);\n    }\n}\n\nGame.prototype.randomPosition = function() {\n    x = Math.floor(Game.DIM_X * Math.random());\n    y = Math.floor(Game.DIM_Y * Math.random());\n    return [x, y];\n}\n\nGame.prototype.wrap = function(pos){\n    if (pos[0] > Game.DIM_X) { pos[0] -= Game.DIM_X}\n    if (pos[0] < 0) { pos[0] += Game.DIM_X }\n    if (pos[1] > Game.DIM_Y) { pos[1] -= Game.DIM_Y }\n    if (pos[1] < 0) { pos[1] += Game.DIM_Y }\n    \n}\n\nGame.prototype.allObjects = function () {\n    return this.asteroids.concat(this.bullets).concat([this.ship]);\n}\n\nGame.prototype.add = function (obj) {\n    if (obj instanceof Bullet) { this.bullets.push(obj)}\n    else if (obj instanceof Asteroid) { this.asteroids.push(obj) }\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module, __webpack_require__ */
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("// Stores a Game instance.\n// Stores a canvas context to draw the game into.\n// Installs key listeners to move the ship and fire bullets.\n// Installs a timer to call Game.prototype.step.\n\nconst Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\n\nfunction GameView(ctx){\n    this.game = new Game();\n    this.ctx = ctx;\n    this.bindKeyHandlers();\n}\n\nGameView.prototype.start = function() {\n    boundStep = this.game.step.bind(this.game);\n    boundDraw = this.game.draw.bind(this.game);\n    let cntx = this.ctx;\n    setInterval(function() {\n        boundStep();\n        boundDraw(cntx);\n    }, 20)\n    \n}\n\nGameView.prototype.bindKeyHandlers = function(){\n    boundPower = this.game.ship.power.bind(this.game.ship);\n    boundFireBullet = this.game.ship.fireBullet.bind(this.game.ship);\n    key(\"up\", function() {\n        boundPower([0, -1]);\n    });\n    key(\"down\", function () {\n        boundPower([0, 1]);\n    });\n    key(\"left\", function () {\n        boundPower([-1, 0]);\n    });\n    key(\"right\", function () {\n        boundPower([1, 0]);\n    });\n    key(\"space\", function () {\n        boundFireBullet();\n    });\n}\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module */
/***/ ((module) => {

eval("// Base class for anything that moves.\nfunction MovingObject(args){\n    this.pos = args[\"pos\"];\n    this.vel = args[\"vel\"];\n    this.radius = args[\"radius\"];\n    this.color = args[\"color\"];\n    this.game = args[\"game\"];\n}\n\nMovingObject.prototype.move = function(){\n    this.pos[0] += this.vel[0];\n    this.pos[1] += this.vel[1];\n    this.game.wrap(this.pos);\n}\n\nMovingObject.prototype.draw = function(ctx){\n    ctx.beginPath();\n    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);\n    ctx.fillStyle = this.color;\n    ctx.fill();\n}\n// this is math, not JavaScript\n//Dist([x_1, y_1], [x_2, y_2]) = sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)\nMovingObject.prototype.isCollidedWith = function(otherMovingObject){\n    const dist = Math.sqrt((this.pos[0] - otherMovingObject.pos[0]) ** 2 + (this.pos[1] - otherMovingObject.pos[1]) ** 2);\n    return dist < (this.radius + otherMovingObject.radius);\n}\n\nMovingObject.prototype.collideWith = function (otherObject) {}\n\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module, __webpack_require__ */
/*! CommonJS bailout: module.exports is used directly at 38:0-14 */
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\nconst Bullet = __webpack_require__(/*! ./bullet */ \"./src/bullet.js\");\n\n// This is you! Another MovingObject subclass.\nfunction Ship(args){\n    args = {\n        pos: args[\"pos\"],\n        color: Ship.COLOR,\n        radius: Ship.RADIUS,\n        vel: [0, 0],\n        game: args[\"game\"]\n    };\n    MovingObject.call(this, args);\n}\n\nUtil.inherits(Ship, MovingObject);\n\nShip.prototype.relocate = function(){\n    this.vel = [0, 0];    \n    this.pos = this.game.randomPosition();\n}\n\nShip.prototype.power = function(impulse) {\n    this.vel[0] += impulse[0];\n    this.vel[1] += impulse[1];\n}\n\nShip.prototype.fireBullet = function () {\n    const bullet = new Bullet({ vel: [this.vel[0] * 5, this.vel[1] * 5], pos: this.pos.slice(), game: this.game});\n    console.log(bullet)\n    this.game.bullets.push(bullet);\n}\n\nShip.RADIUS = 40;\nShip.COLOR = \"Green\";\n\nmodule.exports = Ship;\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module */
/***/ ((module) => {

eval("// Utility code, especially vector math stuff.\n\nconst Util = {\n    inherits(childClass, parentClass) {\n        function Surrogate() {};\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.prototype.constructor = childClass;\n    },\n    \n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n\n    // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    },\n\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

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
eval("const GameView = __webpack_require__(/*! ./game_view */ \"./src/game_view.js\");\n\n\ndocument.addEventListener('DOMContentLoaded', () => {\n    const canvasEl = document.getElementById('game-canvas');\n    const ctx = canvasEl.getContext('2d');\n    console.log(\"Webpack is working!\");\n\n    window.GameView = GameView;\n    window.ctx = ctx;\n    window.gameView = new GameView(ctx);\n    window.gameView.start();\n});\n\n//# sourceURL=webpack:///./src/index.js?");
})();

/******/ })()
;