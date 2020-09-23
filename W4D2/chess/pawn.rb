
class Pawn < Piece

    def symbol
        :P
    end

    def move_dirs
    end
        

    private
    def at_start_row?
        (color == :W && pos[0] == 1) || (color == :B && pos[0] == 6)
    end

    def forward_dir
        color == :W ? -1 : 1
    end

    def forward_steps
        at_start_row? ? 2 : 1
    end

    def side_attacks
        attacks = []
        x, y = pos
        left_attack_pos = [x + forward_dir, y - 1]
        right_attack_pos = [x + forward_dir, y + 1]
        attacks << left_attack_pos if position_is_valid?(left_attack_pos) && piece_is_enemy_color?(left_attack_pos)
        attacks << right_attack_pos position_is_valid?(right_attack_pos) && piece_is_enemy_color?(right_attack_pos)
        attacks
    end

    def position_is_valid?(pos)
        board.valid_pos?(pos)
    end

    def position_is_empty?(pos)
        x, y = pos
        board.rows[x][y].color.nil?
    end

    def piece_is_enemy_color?(pos)
        x, y = pos
        !position_is_empty(pos) && board.rows[x][y].color != color
    end
end