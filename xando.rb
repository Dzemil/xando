board = Array.new(10) {|i| i = " "}

class Player
  attr_accessor :name, :symbol


  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @number = 0
  end

  def play_turn(board, number)
    unless number.between?(1,9)
      puts "Please input number from 1 to 9"
      return
    end
    
    board[number] = symbol
    puts board
  end
end

player1 = Player.new("Piljo", "X")
player1.play_turn(board, 3)
player2 = Player.new("Biljan", "O")
player2.play_turn(board, 0)
