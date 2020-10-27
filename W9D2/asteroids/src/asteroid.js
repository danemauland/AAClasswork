// Spacerock. It inherits from MovingObject.

const MovingObject = require("./moving_object");
const Ship = require("./ship");
const Util = require("./utils");


function Asteroid(args) {
    args = {
    pos: args["pos"],
    color: Asteroid.COLOR,
    radius: Asteroid.RADIUS,
    vel: Util.randomVec(Asteroid.SCALAR),
    game: args["game"]
    };
    MovingObject.call(this, args);
}

Util.inherits(Asteroid, MovingObject);

Asteroid.prototype.collideWith = function (otherObject) {
    if (otherObject instanceof Ship) {
        otherObject.relocate();
    } else {
        this.game.remove(this);
        this.game.remove(otherObject);
    }
}

Asteroid.COLOR = 'Red';
Asteroid.RADIUS = 10;
Asteroid.SCALAR = 1;

module.exports = Asteroid;