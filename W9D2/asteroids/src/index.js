const GameView = require('./game_view');


document.addEventListener('DOMContentLoaded', () => {
    const canvasEl = document.getElementById('game-canvas');
    const ctx = canvasEl.getContext('2d');
    console.log("Webpack is working!");

    window.GameView = GameView;
    window.ctx = ctx;
    window.gameView = new GameView(ctx);
    window.gameView.start();
});