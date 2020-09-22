class Players
  attr_accessor :array_board, :array_random, :name, :rounds, :player_or_computer

  @@array_board = ["_", "_", "_", "_"]
  @@right_position = 0
  @@right_colour = 0
  @@rounds = 1
  @@array_random = []
  def initialize(name, player_or_computer)
    @name = name
    @player_or_computer = player_or_computer
  end

  def player
    puts "\nWhat is your name?"
    @name = gets.chomp
  end

  def self.board
    puts "\n#{@@array_board[0]} #{@@array_board[1]} #{@@array_board[2]} #{@@array_board[3]}"
  end

  def find_array
    puts "\nFind the correct combination!
    \n"
    until @@array_board == @@array_random || @@rounds == 13
      @@right_position = 0
      @@right_colour = 0
      if self.player_or_computer == "player"
        self.select_colour
      else
        self.computer_play
      end
      Players.board
      i = 0
      while i < 4 do
        if @@array_board[i] == @@array_random[i]
          @@right_position += 1
        end
        i += 1
      end
      k = 0
      while k < 4
        l = 0
        while l < 4
          if @@array_random[k] == @@array_board[l] 
            @@right_colour += 1
            l = 4
          else
            l += 1
          end
        end
        k += 1
      end
      puts "\nTurn #{@@rounds}. 
      You have #{@@right_position} correct answers! 
      You have #{@@right_colour - @@right_position} misplaced colours!
      \n"
      @@rounds += 1
    end
    Players.replay
  end

  def select_array
    i = 0
    while i < 4
      puts "\nChoose position #{i + 1} (B, O, V, R, G, Y)"
      @@array_random[i] = gets.upcase.chomp
      i += 1
      puts "#{@@array_random}"
    end
  end

  def self.replay
    if @@rounds == 13 && @@array_board != @@array_random
      puts "\nGame over! Do you want to replay? (Y/n)"
      replay = gets.downcase.chomp 
      if replay == "y"
        @@rounds = 1
        @@array_board = ["_", "_", "_", "_"]
        game = Game.new
      else
        puts "Bye!"
      end
    else
      puts "\nCongratulations!"
    end 
  end
  
  def random_selection
    @@array_random = ["B", "O", "V", "R", "G", "Y"].sample(4)
  end

  def computer_play
  end

  def select_colour
    @k = 0
    while @k < 4
      puts "#{@name}, what do you think is position #{@k + 1}? (B, O, V, R, G, Y)"
      @@array_board[@k] = gets.upcase.chomp     
      if @@array_board[@k] == "B" ||
         @@array_board[@k] == "O" ||
         @@array_board[@k] == "V" ||
         @@array_board[@k] == "R" ||
         @@array_board[@k] == "G" ||
         @@array_board[@k] == "Y"
        @k += 1
      else
      puts "Error"
     end
    end
  end

end

class Codemaker < Players
end

class Codebreaker < Players
end

class Game

  def initialize
    puts "\nWelcome to the game of Mastermind!"
    puts "\nWhat do you want to play, the Codemaker ('1') or the Codebreaker ('2')?"
    @choice = gets.downcase.chomp
    if @choice == "1"
      codemaker = Codemaker.new("player", "player")
      codemaker.player
      codebreaker = Codebreaker.new("computer", "computer")
      codemaker.select_array
      Players.board
      codebreaker.find_array
    elsif @choice == "2"
      codebreaker = Codebreaker.new("player", "player")
      codebreaker.player
      codemaker = Codemaker.new("computer", "computer")
      codemaker.random_selection
      Players.board
      codebreaker.find_array
    else
      puts "Error! Type 1 to play the Codemaker or 2 to play the Codebreaker!"
      initialize
    end
  end

end

game = Game.new

