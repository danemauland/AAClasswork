//Holds collections of the asteroids, bullets, and your ship.
// Keeps track of dimensions of the space; 
//wraps objects around when they drift off the screen.

const Asteroid = require("./asteroid");
const Ship = require("./ship");
const Bullet = require("./bullet");

function Game() {
    this.asteroids = [];
    this.addAsteroids();
    this.ship = new Ship({pos: this.randomPosition(), game: this});
    this.bullets = [];
}

Game.DIM_X = 500;
Game.DIM_Y = 500; 
Game.NUM_ASTEROIDS = 6;
// "Game.prototype.step" method calls "Game.prototype.move" on all the objects
Game.prototype.step = function(ctx) {
    this.moveObjects(ctx);
    this.checkCollisions();
}


// Game.prototype.checkCollisions checks for colliding objects.
Game.prototype.checkCollisions = function () {
    for (let i = 0; i < this.allObjects().length - 1; i++) {
        for (let j = i + 1; j < this.allObjects().length; j++) {
            if (this.allObjects()[i].isCollidedWith(this.allObjects()[j])){
                this.allObjects()[i].collideWith(this.allObjects()[j])
            };
        }
    }
    
}

// Game.prototype.draw(ctx) draws th e game.
Game.prototype.draw = function (ctx) {
    ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
    for (let item of this.allObjects()) {
        item.draw(ctx);
    }
}

Game.prototype.moveObjects = function (ctx) {
    for (let item of this.allObjects()) {
        item.move();
    }
}

Game.prototype.addAsteroids = function() {
    for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
        this.add(new Asteroid({pos: this.randomPosition(), game: this}));    
    }
}

Game.prototype.remove = function(obj) {
    if (obj instanceof Asteroid) { 
        let index = this.asteroids.indexOf(obj);
        this.asteroids.splice(index,1);
    } else if (obj instanceof Bullet) {
        let index = this.bullets.indexOf(obj);
        this.bullets.splice(index, 1);
    }
}

Game.prototype.randomPosition = function() {
    x = Math.floor(Game.DIM_X * Math.random());
    y = Math.floor(Game.DIM_Y * Math.random());
    return [x, y];
}

Game.prototype.wrap = function(pos){
    if (pos[0] > Game.DIM_X) { pos[0] -= Game.DIM_X}
    if (pos[0] < 0) { pos[0] += Game.DIM_X }
    if (pos[1] > Game.DIM_Y) { pos[1] -= Game.DIM_Y }
    if (pos[1] < 0) { pos[1] += Game.DIM_Y }
    
}

Game.prototype.allObjects = function () {
    return this.asteroids.concat(this.bullets).concat([this.ship]);
}

Game.prototype.add = function (obj) {
    if (obj instanceof Bullet) { this.bullets.push(obj)}
    else if (obj instanceof Asteroid) { this.asteroids.push(obj) }
}

module.exports = Game;