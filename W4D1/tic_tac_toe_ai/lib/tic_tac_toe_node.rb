require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_mover_mark = (@next_mover_mark == :o ? :x : :o)
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    rows = @board.rows
    children_arr = []
    rows.each_with_index do |row, i|
      row.each_with_index do |tile, j|
        new_board = Board.new(rows.deep_dup)
        if board.empty?([i,j])
          new_board[[i, j]] = @next_mover_mark
          children_arr << TicTacToeNode.new(new_board, @prev_mover_mark, [i,j])
        end
      end
    end
    children_arr
  end

  def losing_node?(evaluator)
    if board.over?
      return board.winner != evaluator && !board.winner.nil?
    end
    if @next_mover_mark == evaluator
      return children.all? do |child|
        child.losing_node?(evaluator)
      end
    else
      return children.any? do |child| 
        child.losing_node?(evaluator)
      end
    end 
  end

  def winning_node?(evaluator)
    if board.over?
      return board.winner == evaluator
    end
    if evaluator == @next_mover_mark
      children.any? {|child| child.winning_node?(evaluator)}
    else
      children.all? {|child| child.winning_node?(evaluator)}
    end
  end
end

class Array
  def deep_dup
    new_arr = []
    self.each {|ele| new_arr << (ele.is_a?(Array) ? ele.deep_dup : ele)}
    new_arr
  end
end