class Tree 
attr_reader :root
def initialize (array)
    @arry = array.uniq.sort
    @root = build_tree(@arry,0,@arry.length - 1)
    @travel_val = []
end

    def build_tree(array,start,last)
    if start > last
        return nil
    end

    mid = (start + last)/2
  
    root = Node.new
    root.value = array[mid]

    root.left_child = build_tree(array,start,mid-1)
    root.right_child = build_tree(array,mid+1,last)

    return root
    end

    def insert(value,root=@root)
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

    def level_order(root=@root,queue=Array.new,ordered_arry=Array.new)

         if root == nil
            return nil
         end

        ordered_arry << root

        queue << root.left_child
        queue << root.right_child

         node = queue.shift

        level_order(node,queue,ordered_arry) if node != nil


        return ordered_arry
    end

    def inorder(root,array=Array.new)
        return nil if root == nil 

        inorder(root.left_child,array)
        @travel_val << root
        inorder(root.right_child,array)
        
        return  @travel_val
    end

    def preorder(root,array=[])
        return nil if root == nil 

        array << root
        preorder(root.left_child,array)      
        preorder(root.right_child,array)
        
        return array
    end

    def postorder(root,array=[])
        return nil if root == nil 

        postorder(root.left_child,array)      
        postorder(root.right_child,array)
        array << root

        return array
    end

    def height(node,num=0,val=0)
        return val if node == nil

        height_val = height(node.left_child, num+1,val)
        height_val = height(node.right_child, num+1,val) 

        val = height_val if height_val < num

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

    def balanced?

        left = height(@root.left_child)
        right = height(@root.right_child)

        if ((left - right).magnitude() <= 1)
           return true 
        end
        return false
    end

    def rebalance
        level_arry = level_order(@root)
        @root = build_tree(level_arry,0,level_arry.length)
    end
    
end


class Node
attr_accessor :left_child
attr_accessor :right_child
attr_accessor :value

    def initialize (value=nil)
        left_child = nil
        right_child = nil
        value = value
    end
end

def check_tree
    random_arry = Array.new(15) {rand(1..100)}
    new_tree = Tree.new([1,2,3,4,5,6])


    puts new_tree.balanced?

    new_tree.preorder(new_tree.root).each {|val| puts val.value}
    puts
    new_tree.inorder(new_tree.root).each {|val| puts val.value}
    puts
    new_tree.postorder(new_tree.root).each {|val| puts val.value}
    
    new_tree.insert(100)
    new_tree.insert(200)
    new_tree.insert(300)

    new_tree.level_order.each {|val| puts val.value}

    puts new_tree.balanced?
   
end

check_tree()
