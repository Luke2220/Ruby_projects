class Tree 
attr_reader :root
def initialize (array)
    @root = build_tree(array,0,array.length-1)
end

    def build_tree(array,start,last)
    if start > last
        puts 'nil'
        return nil
    end

    mid = (start + last)/2
  
    root = Node.new
    root.value = array[mid]

    puts root.value

    root.left_child = build_tree(array,start,mid-1)
    root.right_child = build_tree(array,mid+1,last)

    return root
    end
end




class Node
attr_accessor :left_child
attr_accessor :right_child
attr_accessor :value

    def initialize 
        left_child = nil
        right_child = nil
        value = nil
    end
end

new_tree = Tree.new([1,2,3,4,5,6,7])
