def merge_sort(array)
    if array.length < 2
        return array 
    end

    x = merge_sort(array[0..((array.length-1)/2.to_f).round - 1] ) 
    y = merge_sort(array[((array.length-1)/2.to_f).round..array.length])

    result = []
    x.each do |x_val|
        y.each do |y_val|
            if x_val < y_val
                result << x_val if result.include?(x_val) == false
            else
                result << y_val if result.include?(y_val) == false
            end        
           end
        end
    end
    result += (x + y)
    result

end

p merge_sort([8,7,6,5,4,3,2,1])
