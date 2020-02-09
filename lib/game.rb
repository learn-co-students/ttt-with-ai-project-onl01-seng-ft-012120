require_relative './board.rb'
class Game 
    attr_accessor :board, :token, :player_1, :player_2 

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
        
    end

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 4, 8],
        [2, 4, 6], 
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]   
    ]

    def current_player
        board.turn_count % 2 == 0 ? player_1 : player_2 
    end

    def won?
        WIN_COMBINATIONS.each do |win_array|
            winner_array_board = []
             win_array.each do |each_win_array_value|
                winner_array_board << board.cells[each_win_array_value] 
                end
            if winner_array_board.all?("X") || winner_array_board.all?("O")
                return win_array
            end
        end
    false
    end

    def draw?
        board.full? && !self.won? ? true : false
    end


    def over?
        board.full? || self.won? || self.draw? ? true : false
    end

    def winner
        if self.won?
            win_array = self.won?
            index_of_winning_array = win_array[0]
            return board.cells[index_of_winning_array]
        end
    end

    def turn
        input = current_player.move(@board)
        if !board.valid_move?(input)
            puts "Please make a valid move."
            self.turn 
        elsif board.taken?(input)
            puts "That spot is taken, please choose a free cell."
            self.turn
        else
            board.position(input)
            board.update(input, current_player)
            board.display
        end
    end

    

    def play 
        while !over? 
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end       
    end


end