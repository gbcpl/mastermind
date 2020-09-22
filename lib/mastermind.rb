class Players
  attr_accessor :array_codebreaker, :array_codemaker, :name, :rounds, :player_or_computer, :count_position, :count_colour

  @@array_codebreaker = ["_", "_", "_", "_"]
  @@right_position = 0
  @@right_colour = 0
  @@count_position = 0
  @@count_colour = 0
  @@rounds = 1
  @@array_codemaker = []
  @@finding = 0
  def initialize(name, player_or_computer)
    @name = name
    @player_or_computer = player_or_computer
  end

  def player
    puts "\nWhat is your name?"
    @name = gets.chomp
  end

  def self.board
    puts "\n#{@@array_codebreaker[0]} #{@@array_codebreaker[1]} #{@@array_codebreaker[2]} #{@@array_codebreaker[3]}"
  end

  def find_array
    puts "\nFind the correct combination!
    \n"
    sleep 0.5
    until @@array_codebreaker == @@array_codemaker || @@rounds == 13
      @@right_position = 0
      @@right_colour = 0
      if self.player_or_computer == "player"
        self.select_colour
      else
        self.computer_play
        @@count_position = 0
        @@count_colour = 0      
      end
      wait = 0
      while wait < 3
        print "."
        sleep 0.5
        wait += 1
      end
      Players.board
      i = 0
      while i < 4 do
        if @@array_codebreaker[i] == @@array_codemaker[i]
          @@count_position += 1
          @@right_position += 1
        end
        i += 1
      end
      k = 0
      while k < 4
        l = 0
        while l < 4
          if @@array_codemaker[k] == @@array_codebreaker[l] 
            @@count_colour += 1
            @@right_colour += 1
            l = 4
          else
            l += 1
          end
        end
        k += 1
      end
      sleep 0.5
      puts "\nTurn #{@@rounds}. 
      You have #{@@right_position} correct answers! 
      You have #{@@right_colour - @@right_position} misplaced colours!
      \n"
      sleep 0.5
      @@rounds += 1
    end
    Players.replay
  end

  def select_array
    i = 0
    while i < 4
      puts "\nChoose position #{i + 1} (B, O, V, R, G, Y)"
      @@array_codemaker[i] = gets.upcase.chomp
      i += 1
    end
    sleep 1
    puts "\nYour code is #{@@array_codemaker[0]} #{@@array_codemaker[1]} #{@@array_codemaker[2]} #{@@array_codemaker[3]}"
    sleep 1
  end

  def self.replay
    if @@rounds == 13 && @@array_codebreaker != @@array_codemaker
      puts "\nGame over! Do you want to replay? (Y/n)"
      replay = gets.downcase.chomp 
      if replay == "y"
        @@rounds = 1
        @@array_codebreaker = ["_", "_", "_", "_"]
        game = Game.new
      else
        puts "Bye!"
      end
    else
      puts "\nCongratulations!"
    end 
  end
  
  def random_selection
    @@array_codemaker = ["B", "O", "V", "R", "G", "Y"].sample(4)
  end

  def computer_play
    puts "#{@name} chooses position 1..."
    sleep 0.5
    puts "#{@name} chooses position 2..."
    sleep 0.5
    puts "#{@name} chooses position 3..."
    sleep 0.5
    puts "#{@name} chosses position 4..."
    sleep 0.5
    if @@rounds == 1
      @@array_codebreaker = ["B", "B", "B", "B"]
    elsif @@rounds == 2
      if @@count_position == 1
        @@array_codebreaker = ["B", "O", "O", "O"]
      elsif @@count_position == 0
        @@array_codebreaker = ["O", "O", "O", "O"]
      end
    elsif @@rounds == 3 && @@count_position == 0 && @@count_colour == 0
      @@array_codebreaker = ["V", "R", "G", "Y"]
      @@finding = 1
    elsif @@rounds == 3
      if @@count_position == 2 || @@count_position == 1 && @@count_colour == 1
        @@array_codebreaker = ["B", "O", "V", "V"]
      elsif @@count_position == 1 && @count_colour == 0
      end
    elsif @@rounds > 3 && @@finding == 1
      @@array_codebreaker = ["V", "R", "G", "Y"].shuffle
    elsif @@rounds == 4
    # @@right_colour @@right_position
  end

  def select_colour
    @k = 0
    while @k < 4
      puts "#{@name}, what do you think is position #{@k + 1}? (B, O, V, R, G, Y)"
      @@array_codebreaker[@k] = gets.upcase.chomp     
      if @@array_codebreaker[@k] == "B" ||
         @@array_codebreaker[@k] == "O" ||
         @@array_codebreaker[@k] == "V" ||
         @@array_codebreaker[@k] == "R" ||
         @@array_codebreaker[@k] == "G" ||
         @@array_codebreaker[@k] == "Y"
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
