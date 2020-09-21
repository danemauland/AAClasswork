require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)
    winners = node.children.select {|child| child.winning_node?(mark)}
    return winners.first.prev_move_pos unless winners.empty?
    not_losers = node.children.select {|child| !child.losing_node?(mark)}
    return not_losers.first.prev_move_pos unless not_losers.empty?
    raise "there should always be a non-losing node"

  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
