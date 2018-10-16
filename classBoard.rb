class Board
  attr_accessor :board_cases

  # crée le plateau
  def initialize
    all_cases = ["a1", "a2", "a3", "b1", "b2", "b3", "c1", "c2", "c3"]
		@board_cases = []
		all_cases.each do |case_str|
			@board_cases << BoardCase.new(case_str)
		end
  end 
end

class BoardCase
  attr_accessor :content, :position

  def initialize(position)
  @content = " "
  @position = position
  end
end

class Player
 attr_accessor :pseudo

  def initialize(first_name, symbol)
  	@pseudo = first_name
  	@symbol = symbol
  end
end


class Game 
  attr_accessor :board,:player_1, :player_2

  def initialize(player1, player2, board)
    @player_1 = Player.new(player1,"X")
    @player_2 = Player.new(player2,"O")
    @board = board
  end
end