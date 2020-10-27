
// Function.prototype.inherits = function (superClass) {
//     function Surrogate() {};
//     Surrogate.prototype = superClass.prototype;
//     this.prototype = new Surrogate();
//     this.prototype.constructor = this;
// }


Function.prototype.inherits = function (superClass) {
    this.prototype = Object.create(superClass.prototype)
    this.prototype.constructor = this;
}


//-------------------------------------------------
function MovingObject() {}

MovingObject.prototype.speed = function () {
    console.log("SPEED");
}

function Ship() {}

Ship.inherits(MovingObject);

Ship.prototype.fly = function() {
    console.log("FLYYY");
}

function Asteroid() {}

Asteroid.inherits(MovingObject);

Asteroid.prototype.wipeOutTheDino = function() {
    console.log("OH NOOO :( ");
}

move = new MovingObject();
move.speed();
// move.wipeOutTheDino();
// move.fly();

ship = new Ship();
ship.fly();
ship.speed();
// ship.wipeOutTheDino();

ast = new Asteroid();
ast.wipeOutTheDino();
ast.speed();
// ast.fly();