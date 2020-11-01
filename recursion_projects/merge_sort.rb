def merge_sort(array)
    if array.length < 2
        return array 
    end

    x = merge_sort(array[0..((array.length-1)/2.to_f).round - 1] ) 
    y = merge_sort(array[((array.length-1)/2.to_f).round..array.length])

    result = []
    x.each do |x_val|
        y.each do |y_val|
            if x_val > y_val
                if result.include?(x_val) == false    
                result << y_val         
                end
            elsif x_val < y_val
                if result.include?(y_val) == false   
                result << x_val
                break
                end
            elsif x_val == y_val
                    result << x_val
                    result << y_val
                    break
                end
           end

    result.each do |val|
        if y.index(val) != nil
         y.delete_at(y.index(val))
        end
    end
end
result.each do |val| 
    if x.index(val) != nil
    x.delete_at(x.index(val))
    end
end

   p result += x + y
    result
end

merge_sort([999,9,7,8,5,55,6,6,2,1,4,9])
