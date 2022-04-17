class TTT

    def initialize
        @board = [
            "*",
            "*",
            "*",
            "*",
            "*",
            "*",
            "*",
            "*",
            "*"
        ]
        @rows = [
            "| #{@board[0]} | #{@board[1]} | #{@board[2]} |",
            "| #{@board[3]} | #{@board[4]} | #{@board[5]} |",
            "| #{@board[6]} | #{@board[7]} | #{@board[8]} |"
        ]
        @win_conditions = [
            [0,1,2], #horizontal
            [3,4,5],
            [6,7,8],
            [0,3,6], #vertical
            [1,4,7],
            [2,5,8],
            [0,4,8], #diagnal
            [2,4,6]
        ]
        
        start_game
    end

    def start_game
        update_board
        loop do
            puts "Your turn! Make a selection [1-9]:> "
            i = gets.chomp.to_i - 1
            if @board[i] != "*" and @board[i] != "X"
              puts "Your opponent already selected that space!\nPlease choose another!"
              sleep(3)
              clear_screen
              update_board
              next
            else
              @board[i] = "X"
              clear_screen
              update_board
              check_winner
              check_tie
            end
            
            puts "It is now you opponents turn please wait.."
            sleep(rand(0..10))
            loop do
              i = rand(0..8)
              move = @board[i]
              if move == "O" or move == "X"
                next
              else 
                @board[i] = "O"
                clear_screen
                update_board
                check_winner
                check_tie
                break
              end
            end
        end
    end

    def update_board
        puts "-" * @rows[1].length
        @rows.each do |row|
            sep = "-" * row.length
            puts "#{row}\n#{sep}"
        end
    end

    def check_winner
        @win_conditions.each do |x|
            pos1, pos2, pos3 = x[0], x[1], x[2]
            ptoken1, ptoken2, ptoken3 = board[pos1], board[pos2], board[pos3]
        
            if ptoken1 == "X" and ptoken2 == "X" and ptoken3 == "X"
              puts "Congratulations you are the tic-tac-toe champion!"
              exit
            elsif ptoken1 == "O" and ptoken2 == "O" and ptoken3 == "O"
              puts "Oh no! Better luck next time you lost!"
              exit
            end
        end
    end

    def check_tie
        i = 0
        board.each do |pos|
            if pos != "*"
                i += 1
            end

            if i == 9
                puts "The game ended in a draw!"
                exit
            else
                nil
            end
        end
    end

    def clear_screan
        if Gem.win_platform?
            system "cls"
        else
            system "clear"
        end
    end

end #EOC

game = TTT.new