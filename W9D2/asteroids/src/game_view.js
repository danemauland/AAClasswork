// Stores a Game instance.
// Stores a canvas context to draw the game into.
// Installs key listeners to move the ship and fire bullets.
// Installs a timer to call Game.prototype.step.

const Game = require("./game");

function GameView(ctx){
    this.game = new Game();
    this.ctx = ctx;
    this.bindKeyHandlers();
}

GameView.prototype.start = function() {
    boundStep = this.game.step.bind(this.game);
    boundDraw = this.game.draw.bind(this.game);
    let cntx = this.ctx;
    setInterval(function() {
        boundStep();
        boundDraw(cntx);
    }, 20)
    
}

GameView.prototype.bindKeyHandlers = function(){
    boundPower = this.game.ship.power.bind(this.game.ship);
    boundFireBullet = this.game.ship.fireBullet.bind(this.game.ship);
    key("up", function() {
        boundPower([0, -1]);
    });
    key("down", function () {
        boundPower([0, 1]);
    });
    key("left", function () {
        boundPower([-1, 0]);
    });
    key("right", function () {
        boundPower([1, 0]);
    });
    key("space", function () {
        boundFireBullet();
    });
}
module.exports = GameView;