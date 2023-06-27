board = Array.new(9, ".")

def print_board(board)
  board.each_slice(3) { |a| puts a.join(" ")}
end

print_board(board)