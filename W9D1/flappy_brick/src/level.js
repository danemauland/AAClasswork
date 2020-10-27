const CONSTANTS = {
    HOR_SPACE: 220,
    VERT_SPACE: 150,
    PIPE_VEL: -1,
    PIPE_WIDTH: 50,
};

export default class Level {
  constructor(dimensions) {
    this.dimensions = dimensions;
    this.pipes = [];
    this.addPipes();
    debugger;
  }

  drawBackground(ctx) {
    ctx.fillStyle = "skyblue";
    ctx.fillRect(0, 0, this.dimensions.width, this.dimensions.height);
  }

  animate(ctx) {
    this.drawBackground(ctx);
    this.movePipes()
    this.drawPipes(ctx)
  }

  addPipes () {
    this.pipes.push([this.dimensions.width, this.genPipeHeight()]);
    this.addPipe();
    this.addPipe();

  }

  addPipe() {
    this.pipes.push([this.pipes[this.pipes.length - 1][0] + CONSTANTS.HOR_SPACE, this.genPipeHeight()])
  }

  genPipeHeight() {
    return Math.floor((this.dimensions.height - CONSTANTS.VERT_SPACE - 1) * Math.random())
  }

  movePipes() {
    for (let i = 0; i < this.pipes.length; i++) {
      this.pipes[i][0] += CONSTANTS.PIPE_VEL;
    }
  }

  drawPipes(ctx) {
    for (let i = 0; i < this.pipes.length; i++) {
      ctx.fillStyle = "green";
      ctx.fillRect(this.pipes[i][0] - CONSTANTS.PIPE_WIDTH / 2, 0, CONSTANTS.PIPE_WIDTH, this.pipes[i][1]);
      ctx.fillRect(this.pipes[i][0] - CONSTANTS.PIPE_WIDTH / 2, this.pipes[i][1] + CONSTANTS.VERT_SPACE, CONSTANTS.PIPE_WIDTH, this.dimensions.height);
    }
    if (this.pipes[0][0] <= - CONSTANTS.PIPE_WIDTH / 2 ) {
      this.pipes.shift;
      this.addPipe();
    }
  }


}