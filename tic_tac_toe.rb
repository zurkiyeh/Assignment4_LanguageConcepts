#test

# A class to store a player, has a name and char which can be either 'x' or 'o'

class Player
	attr_accessor :name, :symbol

	def initialize (_name, _symbol)
		@name = _name
		@symbol = _symbol
	end
end

class Move
	attr_accessor :row, :col, :player

	def initialize (_row, _col, _player)
		@row = _row
		@col = _col
		@player = _player
	end  

end


=begin
	
class Dog  
  def initialize(breed, name)  
    # Instance variables  
    @breed = breed  
    @name = name  
  end  
	
=end
class Game
	attr_accessor :Player1, :Player2, :board, :bool_board

	def initialize(_Player1,_Player2)
	@Player1 =  _Player1
	@Player2 = _Player2
	@board = [['_','_','_'],['_','_','_'],['_','_','_']]
	@bool_board = [[false ,false ,false ],[false ,false ,false ],[false ,false ,false ]]

	end
end

def print_board (_board)

	i = 0
	j = 0

	while i<3 do
		
		print '[ '
		
		j = 0
		while j<3 do
			print "#{_board[i][j]} " 
			j += 1
		end
		
		print ']'
		puts "\n"
		i += 1
	end
puts
end



def check_win(_player, _game)

	_board = _game.board

	sym = _player.symbol
	won = false
	 
	 #check rows
	 i = 0
	while i<3 do

		if (_board[i][0] == sym)&& (_board[i][1] == sym) && (_board[i][2] == sym)
			won = true
		end
		i += 1
	end


	 #check columns
	 i = 0
	while i<3 do

		if (_board[0][i] == sym)&& (_board[1][i] == sym) && (_board[2][i] == sym)
			won = true
		end
		i += 1
	end

 #check Diagonals
	if (_board[0][0] == sym)&& (_board[1][1] == sym) && (_board[2][2] == sym)
		won = true
	end

	if (_board[0][2] == sym)&& (_board[1][1] == sym) && (_board[2][0] == sym)
		won = true
	end

return won

end


#Returns true if input was successful
def computer_turn(_player, _board)

end



def submit_move(_move,_game)

	row = _move.row
	col = _move.col
	plyr = _move.player

	boolBoard = _game.bool_board
	board= _game.board
	
	if (!boolBoard[row][col])
		board[row][col] = plyr.symbol
		boolBoard[row][col] = true
		return true
	else
		return false
	end
end


def check_for_tie(_game)
	tie = true
	boolBoard = _game.bool_board
	i = 0
	j = 0
	 while (i<3)
	 	while (j<3)
	 		if (boolBoard[i][j] == false)
	 			tie = false
	 		end
	 		j += 1
	 	end
	 	i += 1
	 	j = 0
	 end
	 return tie
end

# Start the game
winner = false
puts "Enter your name"
player_name= gets
puts 

_plyr1 = Player.new(player_name, 'x')
_plyr2 = Player.new("CPU", 'o')

tic_tac_toe = Game.new(_plyr1, _plyr2)
print_board(tic_tac_toe.board)

game_over = false


while (!game_over) do

input_flag = false 



puts "Player's Turn. Input row (1-3) and column(1-3) number seperated by a space."
while (!input_flag) do

	input = gets
	array = input.split(' ')
	row = array [0].to_i - 1
	col = array [1].to_i - 1

	move = Move.new(row,col,_plyr1)

	 if (!submit_move(move,tic_tac_toe))
	 	puts "Index is already used, try another input"
	 	input_flag = false
	 else
	 	input_flag = true
	 end
end

print_board(tic_tac_toe.board)
game_over = check_win(_plyr1, tic_tac_toe)
if (game_over)
	winner = _plyr1
	break
end


if (check_for_tie(tic_tac_toe)&& (winner== false))
	puts "The game is a tie, no winner"
	break
end


puts "#{_plyr2.name}'s Turn"	

input_flag = false 
while (!input_flag)
	row_index = rand(3)
	col_index = rand(3)

	move = Move.new(row_index,col_index,_plyr2)

		 if (!submit_move(move,tic_tac_toe))
		 	input_flag = false
		 else
		 	input_flag = true
		 end
	end

print_board(tic_tac_toe.board)
game_over = check_win(_plyr2, tic_tac_toe)
if (game_over)
	winner = _plyr2
	break
end

if (check_for_tie(tic_tac_toe)&& (winner== false))
	puts "The game is a tie, no winner"
	break
end
end

if (winner != false)
	puts "The winner is: #{winner.name}"
end
