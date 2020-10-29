function View(game, dom) {
    this.game = game;
    this.$el = $(dom)

    
    this.setupTowers();
    this.render();
    this.$el.on("click", "ul", this.clickTower.bind(this))
}

View.prototype.setupTowers = function() {
    for (let i = 0; i < 3; i++) {
        const $tower = $("<ul>");
        $tower.attr("id", `${i}`);
        for (let j = 0; j < 3; j++) {
            const $disc = $("<li>");
            $disc.attr("id", `${i}-${j}`);
            $tower.append($disc);
        }
        this.$el.append($tower);
    }
}

View.prototype.render = function() {
    $("li").removeClass();
    for (let i = 0; i < this.game.towers.length; i++) {
        for (let j = 0; j < this.game.towers[i].length; j++) {
           $(`#${i}-${j}`).addClass(`disc-${this.game.towers[i][j]}`)
        }
    }
}

View.prototype.clickTower = function(event) {
    
    if (this.firstTower || this.firstTower === 0) {
        this.secondTower = parseInt(event.currentTarget.id);
        this.game.move(this.firstTower, this.secondTower);
        this.firstTower = undefined;
        $(".clicked").removeClass("clicked")
        this.render();
    } else {
        this.firstTower = parseInt(event.currentTarget.id);
        $(event.currentTarget).addClass("clicked")
    }

    if (this.game.isWon()) {
        this.$el.off("click");
        this.$el.addClass("game-completed")
        this.render();

        setTimeout( function() {
            alert("You won!");
        },0)
    }
}
module.exports = View;