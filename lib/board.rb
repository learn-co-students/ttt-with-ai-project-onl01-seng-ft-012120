require 'pry'
class Board

    attr_accessor :cells 

    def initialize 
        @cells = Array.new(9, " ")
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def display 
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def full?
        @cells.all?("X" || "O") ? true : false 
    end

    def turn_count
        num_turns = 0
        @cells.each do |i|
            if i == "X" || i == "O"
                num_turns += 1 
            end
        end
        num_turns
    end

    def taken?(input)
        position(input) == "X" || position(input) == "O" ? true : false
    end

    def valid_move?(input)
        index = input.to_i - 1 
        if index.between?(0, 8) && !self.taken?(input)
          return true 
        else 
            return false
        end
    end

    def position(input)
        index = input.to_i - 1 
        @cells[index]
    end

    def update(input, player)
        @cells[input.to_i - 1] = player.token
        #binding.pry
    end

end
