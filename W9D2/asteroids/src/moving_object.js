// Base class for anything that moves.
function MovingObject(args){
    this.pos = args["pos"];
    this.vel = args["vel"];
    this.radius = args["radius"];
    this.color = args["color"];
    this.game = args["game"];
}

MovingObject.prototype.move = function(){
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
    this.game.wrap(this.pos);
}

MovingObject.prototype.draw = function(ctx){
    ctx.beginPath();
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
    ctx.fillStyle = this.color;
    ctx.fill();
}
// this is math, not JavaScript
//Dist([x_1, y_1], [x_2, y_2]) = sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)
MovingObject.prototype.isCollidedWith = function(otherMovingObject){
    const dist = Math.sqrt((this.pos[0] - otherMovingObject.pos[0]) ** 2 + (this.pos[1] - otherMovingObject.pos[1]) ** 2);
    return dist < (this.radius + otherMovingObject.radius);
}

MovingObject.prototype.collideWith = function (otherObject) {}


module.exports = MovingObject;