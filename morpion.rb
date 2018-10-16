require_relative 'classBoard.rb'

  # affiche le plateau
def board_grid(board)
  puts
  puts "   1   2   3"
  puts "A  #{board.board_cases[0].content} | #{board.board_cases[1].content} | #{board.board_cases[2].content} " 
  puts "  ---|---|---"
  puts "B  #{board.board_cases[3].content} | #{board.board_cases[4].content} | #{board.board_cases[5].content} "
  puts "  ---|---|---"
  puts "C  #{board.board_cases[6].content} | #{board.board_cases[7].content} | #{board.board_cases[8].content} "
  puts
end

# qui a gagné ?
def win_check(game,player)
  victory = [[game[0].content, game[1].content, game[2].content],
             [game[0].content, game[4].content, game[8].content],
             [game[0].content, game[3].content, game[6].content],
             [game[3].content, game[4].content, game[5].content],
             [game[6].content, game[7].content, game[8].content],
             [game[6].content, game[4].content, game[2].content],
             [game[1].content, game[4].content, game[7].content],
             [game[2].content, game[5].content, game[8].content]]

  victory.each do |trio|
    if trio[0] == "X" && trio[1] == "X" && trio[2] == "X"
      puts "#{player.player_1.pseudo} win"
    else trio[0] == "O" && trio[1] == "O" && trio[2] == "O"
      puts "#{player.player_2.pseudo} win"
    end
  end
end

# demande au joueur de jouer et passe au joueur suivant si la partie n'est pas finie:
def player_turn(cell,count,player)
  if count.even?
    puts "c'est à #{player.player_1.pseudo} de jouer "
  else puts "c'est à #{player.player_2.pseudo} de jouer "
  end
    puts "Choisi une case:"
    player_choice = gets.chomp.downcase
    cell.each do |cases|
      if player_choice == cases.position 
        if cases.content == " "
          if count.even?
            cases.content = "X"
          else cases.content = "O"
          end
        elsif player_choice == "q" or player_choice == "quit"
          return false
        else puts "cette case est deja jouée"
        end
      else puts "cette casse n'exite pas"
      end
    end
end

# Début de la partie
def start_game
  puts "Salut, comment ça va ? Une petite partie de TicTacToe ?"
  puts "Règles du jeu : well, c'est juste un morpion donc si tu connais pas les règles t'as raté trop de truc dans ta life et je peux rien y faire...\n Sinon pour jouer il te suffit de rentrer les coordonnées de ta case tel que A1,A2,B3,C1 etc..."
  puts "Let's play !!"
  gets.chomp
  puts "quel est le prenom du joueur 1?"
  input1 = gets.chomp
  puts "quel est le prenom du joueur 2?"
  input2 = gets.chomp
  board = Board.new
  return game = Game.new(input1, input2, board)
end

def perform
  my_game = start_game
  board_grid(my_game.board)
  count = 0
  game_loop = true
    while (game_loop)
    player_turn(my_game.board.board_cases,count,my_game)
    board_grid(my_game.board)
    count+=1
      if count >= 3 
       win_check(my_game.board.board_cases,my_game)
      end
      if count>8
        puts "match nul"
        game_loop = false
      end
    end
    puts "Une autre partie Y/N?"
    input = gets.chomp.downcase
      if input == "y"
        perform
      else puts "BYE BYE"  
      end

end


perform
