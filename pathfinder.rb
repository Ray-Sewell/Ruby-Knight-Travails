class Pathfinder
    attr_reader :parent, :position
    def initialize(position, target, queue=[], parent=nil)
        @@potential = [[-2,1],[-1,2],[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1]]
        @target = target
        @position = position
        @queue = queue
        @parent = parent
        @legal = legal_moves
    end
    def discover
        if @legal.include?(@target)
            return parent_follow(self).reverse
        end
        @legal.each do |pos|
            @queue.push(Pathfinder.new(pos, @target, @queue, self))
        end
        node = @queue.shift
        node.discover
    end
    def legal_moves
        legal = []
        @@potential.each do |move|
            move = [(move[0] + @position[0]), (move[1] + @position[1])]
            if move[0].between?(0,7) && move[1].between?(0,7)
                legal.push(move)
            end
        end
        return legal
    end
    def parent_follow(node, path=[])
        path.push(node.position)
        if node.parent.nil?
            return path
        end
        return parent_follow(node.parent, path)
    end
end