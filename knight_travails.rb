class Board

def initialize
    @board = Array.new(8) {Square.New}
    fill_board(@board)
end

def fill_board(board)
    counter = 0
    board.map! do |val|
        counter << 1
        val.x_pos = counter
        val.y_pos = counter
    end
end

end

class Knight
    attr_accessor :current_pos, :path
    def initialize(current_pos)
        @current_pos = current_pos
        temp = Node.new
        temp.grid_pos = current_pos
        @path = [temp]
        @shortest_path_length = 0
    end

    def is_node_in_path(path,square_to_compare)
        puts path.length()
        path.each  do |val| 
            if val.grid_pos.equals?(square_to_compare)
                puts "in path #{val.grid_pos.print_value}"
             return true
            end
         end
         return false
    end

    def knight_move(current_pos,destination,moves=0,path=[])

        return nil if (@shortest_path_length != 0 && @shortest_path_length < moves)
        
       puts "stack: #{moves}"

        next_pos = Square.new
        next_pos.x_pos = (current_pos.x_pos + 2 )
        next_pos.y_pos = (current_pos.y_pos + 1 ) 
    

        if (next_pos.equals?(destination))
            if (moves < @shortest_path_length || @shortest_path_length ==0)
                @shortest_path_length = moves
                
                node = Node.new    
                path << node
                node.grid_pos = next_pos  
                #p path
                @path = path
                puts 'found path' 
            end
            return next_pos 
            puts 'found path'
        elsif (next_pos.within_board? && is_node_in_path(path, next_pos) == false)
                node = Node.new    
                path << node
                node.grid_pos = next_pos  
                #p path
                node.next_step = knight_move(node.grid_pos,destination,moves+1,path)       
        end

        next_pos.x_pos = (current_pos.x_pos - 2)
        next_pos.y_pos = (current_pos.y_pos + 1)

         if (next_pos.equals?(destination))
            if (moves < @shortest_path_length || @shortest_path_length ==0)
                @shortest_path_length = moves
                
                node = Node.new    
                path << node
                node.grid_pos = next_pos  
                #p path
                @path = path
                puts 'found path'
            end
            return next_pos 
            puts 'found path'
        elsif (next_pos.within_board? && is_node_in_path(path, next_pos) == false)
                node = Node.new    
                path << node
                node.grid_pos = next_pos  
                #p path
                node.next_step = knight_move(node.grid_pos,destination,moves+1,path)       
        end

        next_pos.x_pos = (current_pos.x_pos + 2)
        next_pos.y_pos = (current_pos.y_pos - 1)

         if (next_pos.equals?(destination))
            if (moves < @shortest_path_length || @shortest_path_length ==0)
                @shortest_path_length = moves
                
                node = Node.new    
                path << node
                node.grid_pos = next_pos  
                #p path
                @path = path
                puts 'found path'
            end
            return next_pos 
            puts 'found path'
        elsif (next_pos.within_board? && is_node_in_path(path, next_pos) == false)
                node = Node.new    
                path << node
                node.grid_pos = next_pos  
                #p path
                node.next_step = knight_move(node.grid_pos,destination,moves+1,path)       
        end

        next_pos.x_pos = (current_pos.x_pos - 2)
        next_pos.y_pos = (current_pos.y_pos - 1)

         if (next_pos.equals?(destination))
            if (moves < @shortest_path_length || @shortest_path_length ==0)
                @shortest_path_length = moves
                
                node = Node.new    
                path << node
                node.grid_pos = next_pos  
                #p path
                @path = path
                puts 'found path'
            end
            return next_pos 
            puts 'found path'
        elsif (next_pos.within_board? && is_node_in_path(path, next_pos) == false)
                node = Node.new    
                path << node
                node.grid_pos = next_pos  
                #p path
                node.next_step = knight_move(node.grid_pos,destination,moves+1,path)       
        end

        next_pos.x_pos = (current_pos.x_pos + 1)
        next_pos.y_pos = (current_pos.y_pos + 2)

         if (next_pos.equals?(destination))
            if (moves < @shortest_path_length || @shortest_path_length ==0)
                @shortest_path_length = moves
                
                node = Node.new    
                path << node
                node.grid_pos = next_pos  
                #p path
                @path = path
                puts 'found path'
            end
            return next_pos 
            puts 'found path'
        elsif (next_pos.within_board? && is_node_in_path(path, next_pos) == false)
                node = Node.new    
                path << node
                node.grid_pos = next_pos  
                #p path
                node.next_step = knight_move(node.grid_pos,destination,moves+1,path)       
        end


        next_pos.x_pos = (current_pos.x_pos - 1)
        next_pos.y_pos = (current_pos.y_pos + 2)

         if (next_pos.equals?(destination))
            if (moves < @shortest_path_length || @shortest_path_length ==0)
                @shortest_path_length = moves
                
                node = Node.new    
                path << node
                node.grid_pos = next_pos  
                #p path
                @path = path
                puts 'found path'
            end
            return next_pos 
            puts 'found path'
        elsif (next_pos.within_board? && is_node_in_path(path, next_pos) == false)
                node = Node.new    
                path << node
                node.grid_pos = next_pos  
                #p path
                node.next_step = knight_move(node.grid_pos,destination,moves+1,path)       
        end


        next_pos.x_pos = (current_pos.x_pos + 1)
        next_pos.y_pos = (current_pos.y_pos - 2)

         if (next_pos.equals?(destination))
            if (moves < @shortest_path_length || @shortest_path_length ==0)
                @shortest_path_length = moves
                
                node = Node.new    
                path << node
                node.grid_pos = next_pos  
                #p path
                @path = path
                puts 'found path'
            end
            return next_pos 
            puts 'found path'
        elsif (next_pos.within_board? && is_node_in_path(path, next_pos) == false)
                node = Node.new    
                path << node
                node.grid_pos = next_pos  
                #p path
                node.next_step = knight_move(node.grid_pos,destination,moves+1,path)       
        end


        next_pos.x_pos = (current_pos.x_pos - 1)
        next_pos.y_pos = (current_pos.y_pos - 2)

         if (next_pos.equals?(destination))
            if (moves < @shortest_path_length || @shortest_path_length ==0)
                @shortest_path_length = moves
                
                node = Node.new    
                path << node
                node.grid_pos = next_pos  
                #p path
                @path = path
                puts 'found path'
            end
            return next_pos 
            puts 'found path'
        elsif (next_pos.within_board? && is_node_in_path(path, next_pos) == false)
                node = Node.new    
                path << node
                node.grid_pos = next_pos  
                #p path
                node.next_step = knight_move(node.grid_pos,destination,moves+1,path)       
        end
        return @path
    end

end

class Node
    attr_accessor :grid_pos
    attr_accessor :next_step
    attr_accessor :depth

    def initialize
        grid_pos = nil
        next_step = nil
        depth = 0
    end
end


class Square
    attr_accessor :x_pos
    attr_accessor :y_pos
    def initialize(x=0,y=0)
        @x_pos = x
        @y_pos = y
    end

    def within_board?
        if @x_pos > 8 || @x_pos < 0 || @y_pos > 8 || @y_pos < 0
            return false
            puts "out of board at: #{@x_pos}, #{@y_pos}"
        end
        return true
    end

    def equals?(compare_square)
        if (@x_pos == compare_square.x_pos && @y_pos == compare_square.y_pos)
            return true
        end
        return false
    end

    def set_equal(square)
        @x_pos = square.x_pos
        @y_pos = square.y_pos
    end

    def print_value
        puts "x: #{@x_pos}, y: #{@y_pos} "
    end

end

knight = Knight.new(Square.new(1,1))
path = knight.knight_move(knight.current_pos,Square.new(8,8))
knight.path.each{|val| val.grid_pos.print_value}
#path.each {|square| square.print_value} 
