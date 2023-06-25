# array for our board
board = Array.new(3) { Array.new(3) {|i| i = "." }}

def show_board(board)
  puts board.map { |x| x.join(' ') }
end

show_board(board)

class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @row = "."
    @col = "."
  end

  def play_turn(board, row, col)
    # check for valid input
    unless row.between?(0,2)
      unless col.between?(0,2)
        return
        puts "Please input a valid expression"
      end
    end

    #check if board place taken
    if board[row][col] != "."
      puts "Place taken"
      return
    end
    
    board[row][col] = symbol
    show_board(board)
  end
end

player1 = Player.new("Biljan", "X")
player1.play_turn(board, 0, 0)
