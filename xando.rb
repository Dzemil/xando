class Board
  board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end


class Player
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def play_turn(number)
    unless number.between?(1,9)
      puts "Please input number from 1 to 9"
    end
  end
end
