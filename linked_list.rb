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
      
        last_node = at(size())
        last_node.next_node = new_node
        @tail_node = new_node
    end

    def prepend(value)
        new_node = Node.new
        new_node.value = value
        if @head_node != nil
            temp = head_node
            @head_node = new_node
            @head_node.next_node = temp
        else
            @head_node = new_node
            @head_node.next_node = @tail_node
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
            break if current_node.next_node == nil
            counter += 1
            current_node = current_node.next_node
        end
        return current_node
    end

    def pop
        if (size() == 0)
            last_node = @tail_node
            @head_node = nil
            @tail_node = nil
            return last_node
        else
            last_node = @tail_node
            @tail_node = at(size() - 1)
            @tail_node.next_node = nil
            return last_node  
        end         
    end

    def contains?(value)
        current_node = @head_node
        while current_node != nil
            if current_node.value == value
                return true
            end
            current_node = current_node.next_node
        end
        return false
    end

    def find (value)
        index = 0
        current_node  = @head_node
        while current_node != nil
            if current_node.value == value
                return index
            end
            index += 1
            current_node = current_node.next_node  
        end
        return nil
    end


    def to_s
        string_list = ''
        current_node = @head_node
        while current_node != nil

            string_list += "( #{current_node.value} => )" 
            current_node = current_node.next_node           
        end
        return string_list
    end

def insert_at(value,index)

    counter = 0
    current_node = @head_node
    while counter < index - 1
        break if current_node.next_node == nil
        current_node = current_node.next_node
        counter += 1
    end

    new_node = Node.new
    new_node.value = value

    temp = current_node.next_node
    current_node.next_node = new_node
    new_node.next_node = temp

end

def remove_at(index)
    size = size() 
    index = size if index > size

    current_node = at(index)
    previous_node = at(index - 1)
    if index == 0
        @head_node = @head_node.next_node
    elsif (current_node.next_node != nil)
        previous_node.next_node = current_node.next_node
    else
        previous_node.next_node = nil
    end

end

end

class Node
attr_accessor :next_node
attr_accessor :value
    def initialize()
        @next_node = nil
        @value = nil
    end


end
