#require 'httparty'
class SlackMessageService
    def initialize(slack_command_paramaters)
        @command = slack_command_paramaters[:text]
        @user = slack_command_paramaters[:user_name]
        @board = TickTacToeService.new(@command)
    end

    def service_provider
        case @command
            when "help"
                help
            when "turn"
                turn
            when "display"
                display
            else
                error    
        end
    end

    private
    
    def help
        "This command starts a tick tac toe game and these are the following commands:
            \n display: displays current board
            \n quit: quits the current match and starts a new board
            \n @user: initializes the game with some else"
    end
    
    def empty
        "Please supply a slash command" 
    end
    
    def error
        "Wrong command, please use /ttt help command for more information" 
    end
    
    def display
       @board.display_board
    end
    
    def turn
       @board.turn(3, 'O') 
    end
    
    def start
        
    end
    
    def quit
        
    end
end