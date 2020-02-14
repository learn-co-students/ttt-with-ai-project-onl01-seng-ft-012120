require 'pry'
class Board

    attr_accessor :cells

    def initialize
        @cells = Array.new(9, " ")
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def position(input)
         @cells[input.to_i - 1]
    end

    def full?
        @cells.each do |spot|
            return false if spot == " "
        end
        return true
    end

    def turn_count
        count = 0
        @cells.each do |spot|
            count += 1 if spot != " "
        end
        count
    end

    def taken?(spot)
        return true if @cells[spot.to_i - 1] != " "
        return false if @cells[spot.to_i - 1] == " "
    end

    def valid_move?(move)
        if move.to_i >= 1 && move.to_i <= 9 && @cells[move.to_i - 1] == " "
            return true
        else
            return false
        end 
    end

    def update(spot,player)
        @cells[spot.to_i - 1] = player.token
    end 

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n-----------
        #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n-----------
        #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

end