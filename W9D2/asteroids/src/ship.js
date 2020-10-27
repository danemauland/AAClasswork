const MovingObject = require("./moving_object");
const Util = require("./utils");
const Bullet = require("./bullet");

// This is you! Another MovingObject subclass.
function Ship(args){
    args = {
        pos: args["pos"],
        color: Ship.COLOR,
        radius: Ship.RADIUS,
        vel: [0, 0],
        game: args["game"]
    };
    MovingObject.call(this, args);
}

Util.inherits(Ship, MovingObject);

Ship.prototype.relocate = function(){
    this.vel = [0, 0];    
    this.pos = this.game.randomPosition();
}

Ship.prototype.power = function(impulse) {
    this.vel[0] += impulse[0];
    this.vel[1] += impulse[1];
}

Ship.prototype.fireBullet = function () {
    const bullet = new Bullet({ vel: [this.vel[0] * 5, this.vel[1] * 5], pos: this.pos.slice(), game: this.game});
    console.log(bullet)
    this.game.bullets.push(bullet);
}

Ship.RADIUS = 40;
Ship.COLOR = "Green";

module.exports = Ship;