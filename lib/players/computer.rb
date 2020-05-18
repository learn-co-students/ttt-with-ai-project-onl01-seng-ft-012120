require 'pry'
require_relative '../board.rb'
#module Players
    class Player::Computer < Player
        #attr_accessor :board

        def move(board)
            computer_move = rand(0..9)
            num_opponent_tokens = board.cells.count{|cell| cell == identify_other_token}
            #puts "num opp tokens is #{num_opponent_tokens}"
            if board.cells[4] == " "
                computer_move = 5 
            elsif num_opponent_tokens >= 2 
                computer_move = strategy(strategy_play(board), board)
            end
            # if !board.taken?(computer_move)
            #     computer_move = rand(0..9)
            # end
            computer_move
        end

        def identify_other_token
            self.token == "X" ? "O" : "X"
        end

        def strategy_play(board)
            index = []
            index_array = []
            board.cells.collect!.with_index do |value, index| 
                if value == identify_other_token
                    index_array << index 
                end
            end
            Game::WIN_COMBINATIONS.each_with_index do |x, i|
                if (index_array[0] == x[0] || index_array[0] == x[1] || index_array[0] == x[2]) && (index_array[1] == x[0] || index_array[1] == x[1] || index_array[1] == x[2])
                    index << i 
                end
            end
            index
        end

                
        def strategy(array, board)
            move = 0
            array.each do |i|
                Game::WIN_COMBINATIONS[i].each do |win_index|
                    if !board.taken?(win_index + 1)
                        move = win_index + 1 
                    end
                end
            end
            #binding.pry
        move
        end

        

    end
#end