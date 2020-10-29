class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    let func = this;
    this.$el.on('click', "li", function(event) {
      func.makeMove($(event.currentTarget));
    });
  }

  makeMove($square) {
    if ($square.text() === "") {
      $square.addClass(`filled ${this.game.currentPlayer} `);
      let $ul = $(".ttt li")
      let i = $ul.index($square[0]);
      let pos = [parseInt(i / 3), i % 3 ];
      $square.text(this.game.currentPlayer);
      this.game.playMove(pos);
      if (this.game.isOver()) {
        alert(`${this.game.winner()} wins!`)
      }
    } else {
      alert("INVALID MOVE!");
    }
  }

  setupBoard() {
    // const $outer_ul = $("<ul>")
    const $ul = $('<ul>');
    // for (let i = 0; i < 3; i++) {
      for ( let j = 0; j < 9; j ++) {
        $ul.append($('<li>'));
      }   
      // $outer_ul.append($ul);
    // }

    this.$el.append($ul);
  }
}

module.exports = View;
