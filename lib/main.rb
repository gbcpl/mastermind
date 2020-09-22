require_relative 'mastermind'
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
