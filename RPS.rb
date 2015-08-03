class Player
  attr_writer :choice

  def input(player)
    puts "\n#{player}, input:"
    puts "1 for rock"
    puts "2 for paper"
    puts "3 for scissor"
    puts "q to quit\n"

    @choice = gets.chomp
    exit if @choice == "q"

    until ["1", "2", "3", "q"].include?(@choice) do 
      puts "Please enter a valid choice"
      @choice = gets.chomp
      exit if @choice == "q"
    end

    puts "\n#{player} has chosen rock" if @choice == "1"
    puts "\n#{player} has chosen paper" if @choice == "2"
    puts "\n#{player} has chosen scissor" if @choice == "3"

    @choice.to_i
  end

  def computer
    @choice = rand(1..3)

    puts "The computer has chosen rock" if @choice == "1"
    puts "The computer has chosen paper" if @choice == "2"
    puts "The computer has chosen scissor" if @choice == "3"

    @choice
  end
end

class CheckWinner
  attr_writer :result

  def init
    @result = 0
  end

  def winner(choice1, choice2)
    @result = choice1 * choice2

    puts "It's a draw!" if [1, 4, 9].include?(@result)
    puts "Paper beats rock, paper wins!" if @result == "2"
    puts "Rock beats scissor, rock wins!" if @result == "3"
    puts "Scissor beats paper, scissor wins!" if @result =="6"

    @result
  end
end

class RPS

  def one_player
    player1 = Player.new
    computer = Player.new
    winner = CheckWinner.new

    player_choice = player1.input("Player")
    computer_choice = computer.computer

    winner.winner(player_choice, computer_choice)

  end

  def two_player
    player1 = Player.new
    player2 = Player.new
    winner = CheckWinner.new

    player1_choice = player1.input("Player 1")
    player2_choice = player2.input("Player 2")

    winner.winner(player1_choice, player2_choice)
  end

  def init_game
    puts "What mode do you wish to play?"
    puts "1: Play against the computer"
    puts "2: Play against another player"
    puts "q: Quit"

    input = gets.chomp
    until ["1", "2", "q"].include?(input)
      puts "Please enter a valid option."
      input = gets.chomp
    end

    quit if input == "q"
    one_player if input == "1"
    two_player if input == "2"
  end
end

test = RPS.new
test.init_game
