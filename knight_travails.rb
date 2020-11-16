class Board

def initialize
    @board = [[0..9],[0..9]]
end

end

class Node
    attr_accessor :grid_pos
    attr_accessor :next_step

    def initialize(pos,step)
        grid_pos = pos
        next_step = step
    end
end