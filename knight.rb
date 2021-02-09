require_relative("board.rb")
require_relative("pathfinder.rb")

class Knight
    attr_reader :position, :token
    def initialize(board, position=[rand(8),rand(8)], token="♞")
        @board = board
        @position = position
        @token = token
        update_position
    end
    def update_position
        @board.move_knight(self)
    end
    def generate_markers
        @board.place_marker(generate_path)
    end
    def generate_path(pos=@position)
        path = Pathfinder.new(pos, @board.target)
        shortest_path = path.discover
        path_to_string(shortest_path)
        return shortest_path
    end
    def path_to_string(path)
        path = translate_path(path)
        move = path.shift
        print "#{@token} start #{move[0]}#{move[1]}"
        until path.empty?
            move = path.shift
            print " -> #{move[0]}#{move[1]}"
        end
        puts " finish!"
    end
    def translate_path(path)
        translated = []
        path.each do |e|
            translated.push([(e[1] + 65).chr, 8 - e[0]])
        end
        translated.push([(@board.target[1] + 65).chr, 8 - @board.target[0]])
        return translated
    end
end

