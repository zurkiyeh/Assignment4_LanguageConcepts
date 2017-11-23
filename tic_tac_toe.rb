
# A class to store a player, has a name and char which can be either 'x' or 'o'

class Player
	attr_accessor :name, :symbol

	def initialize (_name, _symbol)
		@name = _name
		@symbol = _symbol
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

# A class to hold a game object
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



def game_over ()

end

# Start the game

=begin

	Main game loop:
	- Ask Player 1 to play a move
	- Check if game is done and check who won if true: break out of the loop
	- Ask the other player to play (CPU)
	- Check if game is done and check who won if true: break out of the loop

	
=end

def check_win(_player, _board)

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


_plyr1 = Player.new("Player 1", 'x')
_plyr2 = Player.new("Player 2", 'o')

puts _plyr1.name
puts _plyr1.symbol

puts _plyr2.name
puts _plyr2.symbol

tic_tac_toe = Game.new(_plyr1, _plyr2)
print_board(tic_tac_toe.board)
tic_tac_toe.board =  [['_','_','o'],['_','o','_'],['o','_','_']]
print_board(tic_tac_toe.board)

puts (check_win(_plyr2,tic_tac_toe.board))