board = Array.new(9, ".")

def print_board(board)
  board.each_slice(3) { |a| puts a.join(" ")}
end

print_board(board)

def set_value_turn(board, index, symbol)
  if board[index] == "."
    board[index] = symbol
    print_board(board)
  else
    puts "Value already set"
  end
end
