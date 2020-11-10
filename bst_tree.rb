class Tree 
attr_reader :root
def initialize (array)
    @root = build_tree(array,0,array.length-1)
end

    def build_tree(array,start,last)
    if start > last
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

    def insert(value,root)
        
        if root == nil
            node = Node.new
            node.value = value
            return node
        end

        if value > root.value
            root.right_child = insert(value,root.right_child)
        elsif value < root.value
            root.left_child = insert(value,root.left_child)
        end

        return root

    end

    def delete(value,root)

        return root if root == nil

        if value > root.value
            root.right_child = delete(value,root.right_child)
        elsif value < root.value
            root.left_child = delete(value,root.left_child)
        else

            if root.right_child == nil
                return root.left_child
            elsif root.left_child == nil
                return root.right_child
            else

            root.value = min_value(root.right_child)

            root.right_child = delete(root.right_child,root.value)

        end
    end
    end
    def min_value(root)
        val = root.value
        while root.left_child != nil
            root = root.left_child
            val = root.value
        end
        return val
    end

    def find(start_root,value)
        return nil if start_root == nil

        if value > start_root.value
            start_root = find(start_root.right_child,value)
        elsif value < start_root.value
            start_root = find(start_root.left_child,value)
        elsif value == start_root.value
            return start_root
        end

        return start_root

    end

    def level_order(root,queue)
        arry << root

        queue << @root.left_child
        queue << @root.right_child

        level_order(queue.pop)

        return arry
    end

    def inorder(root)
        return nil if root == nil 

        inorder(root.left_child)
        arry << root
        inorder(root.right_child)

        return arry
    end

    def preorder(root)
        return nil if root == nil 

        arry << root
        inorder(root.left_child)      
        inorder(root.right_child)

        return arry
    end

    def postorder(root)
        return nil if root == nil 

        inorder(root.left_child)      
        inorder(root.right_child)
        arry << root

        return arry
    end

    def height(node,num=0)
        return nil if node == nil

        val = num if num > val

        height(node.left_child, num+1)
        height(node.right_child, num+1)

        return val
    end

    def depth(root,node,num=0)
        return nil if node == nil

        val = num if num > val

        if (node.value > root.value)
            depth(root.right_child,node,num+1)
        elsif(node.value < root.value)
            depth(root.left_child,node,num+1)
        else
            return val
        end

        return val  
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
new_tree.insert(8,new_tree.root)
