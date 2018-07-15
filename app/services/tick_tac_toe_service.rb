require 'json'
class TickTacToeService
    VICTORY = [
        #diagonal
        [0,4,8],
        [2,4,6],
        #vertical
        [0,3,6],
        [1,4,7],
        [2,5,8],
        #horizontal
        [0,1,2],
        [3,4,5],
        [6,7,8]
    ]
    def initialize(message)
        @choice = message
        @board = []
        empty_board
        @board_mapping = {
           "top_left" => "0",
           "top_middle" => "1", 
           "top_right" => "2",
           "middle_left" => "3", 
           "middle" => "4",
           "middle_right" => "5", 
           "bottom_left" => "6",
           "bottom_middle" => "7",
           "bottom_right" => "8"
        }
    end

    def display_board
        " #{@board[0]} | #{@board[1]} | #{@board[2]}
        -----------
          #{@board[3]} | #{@board[4]} | #{@board[5]} 
        -----------
          #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def empty_board
       (0..9).each do |value|
           @board[value] = '-'
        end
        @board 
    end
    
    def turn(index, choice)
        converted_index = index_input(index)
        if (valid_move?(converted_index))
            move(converted_index,choice)
            display_board
            to_json
        else
            return "invalid move please try again"
        end
    end
    
    def index_input(index)
       return (index.to_i - 1)
    end
    
    def move(index, choice)
        return @board[index] = choice
    end
    
    def position_taken?(index)
        taken = true
        if (@board[index] == "-" ) 
            return taken = false
        else 
            return taken 
        end
    end
    
   def valid_move?(index)
       if (index < 0 || index > 9 && position_taken?(index) == true) 
           return false;
       else
            return true;
       end
   end
end
    