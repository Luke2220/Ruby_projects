class LinkedList
attr_reader :head_node
attr_reader :tail_node

def initialize
    @head_node = nil
    @tail_node = nil
end
    def append(value)
        new_node = Node.new
        new_node.value = value
        if @tail_node != nil
            @tail_node.next_node = tail_node
            @tail_node = new_node
        else
            @tail_node = new_node
        end
    end
    def prepend(value)
        new_node = Node.new
        new_node.value = value
        if @head_node != nil
            @head_node.next_node = head_node
            @head_node = new_node
        else
            @head_node = new_node
        end
    end

    def size
        size = 0
        current_node = @head_node
        while current_node.next_node != nil
            current_node = current_node.next_node
            size += 1
        end
        return size
    end

    def at(index)
        counter = 0
        current_node = @head_node
        while counter < index
            counter++
            current_node = current_node.next_node
        end
        return current_node
    end

    def pop
        last_node = @tail_node
        @tail_node = nil
        @tail_node = at(size())
        last_node      
    end

    def contains?(value)
        current_node = @head_node
        while current_node != nil
            if current_node.value == value
                return true
            end
            current_node = current_node.next    
        end
        return false
    end

    def find (value)
        index = 0
        current_node = @head_node
        while current_node != nil
            index += 1
            if current_node.value == value
                return index
            end
            current_node = current_node.next    
        end
        return nil
    end


    def to_s
        string_list = ''
        current_node = @head_node
        while current_node != nil
            current_node = current_node.next_node
            string_list += "( #{current_node.value} => )"
        end
        return string_list
    end



end

class Node
attr_accessor :next_node
attr_accessor :value
    def initialize()
        @next_node = nil
        @value = nil
    end

    def value

    end
end