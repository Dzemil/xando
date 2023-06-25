# array for our board
board = Array.new(3) { Array.new(3) {|i| i = "." }}

def show_board(board)
  puts board.map { |x| x.join(' ') }
end

board[0][1] = "X"
show_board(board)
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