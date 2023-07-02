LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

class Game
  attr_reader :board, :current_player_id

  def initialize(player_1_class, player_2_class)
    @board = Array.new(10)

    @current_player_id = 0
    @players = [player_1_class.new(self, "X"), player_2_class.new(self, "O")]
    puts "#{current_player} goes first."
  end

  def play
    loop do
      place_player_marker(current_player)
      
      if player_has_won?(current_player)
        puts "#{current_player} wins!"
        print_board
        return
      elsif board_full?
        puts "It's a draw."
        print_board
        return
      end
      
      switch_players!
    end
  end

  def place_player_marker(player)
    position = player.select_position!
    puts "#{player} selects #{player.marker} position #{position}"
    @board[position] = player.marker
  end


end

class Player
  attr_reader :marker

  def initialize(game, marker)
    @game = game
    @marker = marker
  end
end