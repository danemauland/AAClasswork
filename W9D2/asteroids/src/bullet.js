const MovingObject = require("./moving_object");
const Util = require("./utils");
//Kill spacerocks with this. Also a MovingObject subclass.
function Bullet(args) {
    args = {
        pos: args["pos"],
        color: "Black",
        radius: 10,
        vel: args["vel"],
        game: args["game"]
    };
    MovingObject.call(this, args);
}

Util.inherits(Bullet, MovingObject);

//MovingObject
module.exports = Bullet;