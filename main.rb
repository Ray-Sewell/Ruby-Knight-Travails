require_relative("board.rb")
require_relative("knight.rb")

board = Board.new
knight = Knight.new(board)
knight.generate_markers
board.pretty_print