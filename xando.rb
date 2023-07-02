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

  def switch_players!
    @current_player_id = other_player_id
  end

  def place_player_marker(player)
    position = player.select_position!
    puts "#{player} selects #{player.marker} position #{position}"
    @board[position] = player.marker
  end

  def player_has_won?(player)
    LINES.any? do |line|
      line.all? {|position| @board[position] == player.marker}
    end
  end

  def print_board
    col_separator, row_separator = " | ", "--+---+--"
    label_for_position = lambda{|position| @board[position] ? @board[position] : position}
    
    row_for_display = lambda{|row| row.map(&label_for_position).join(col_separator)}
    row_positions = [[1,2,3], [4,5,6], [7,8,9]]
    rows_for_display = row_positions.map(&row_for_display)
    puts rows_for_display.join("\n" + row_separator + "\n")
  end

end

class Player
  attr_reader :marker

  def initialize(game, marker)
    @game = game
    @marker = marker
  end
end

class HumanPlaye < Player
  def select_position!
    @game.print_board
    loop do
      print "Select your #{marker} position: "
      selection = gets.to_i
      return selection if @game.free_positions.include?(selection)
      puts "Position #{selection} is not available. Try again."
    end
  end
end