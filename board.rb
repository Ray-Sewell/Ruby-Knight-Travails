require_relative("knight.rb")

class Board
    attr_reader :target
    def initialize(target=[rand(8), rand(8)])
        @board = Array.new(8) {Array.new(8)}
        @target = target
        @board[target[0]][target[1]] = "X"
        @markers = []
    end
    def move_knight(knight)
        @board[knight.position[0]][knight.position[1]] = knight.token
    end
    def place_marker(positions)
        positions.each_with_index do |position, i|
            if @board[position[0]][position[1]].nil?
                @board[position[0]][position[1]] = i
                @markers.push(position)
            end
        end
    end
    def clear_markers
        @markers.each do |position|
            @board[position[0]][position[1]] = nil
        end
        @markers = []
    end
    def pretty_print
        puts "   ┬───┬───┬───┬───┬───┬───┬───┬───┐"
        @board.each_with_index do |row, i|
            print " #{8 - i} │"
            row.each do |value|
                if value.nil?
                    print "   │"
                elsif value.to_s.length > 1
                    print "#{value} │"
                else
                    print " #{value} │"
                end
            end
            puts; puts "   ┼───┼───┼───┼───┼───┼───┼───┼───┤"
        end
        puts "     A   B   C   D   E   F   G   H"
        clear_markers
    end
    
end