def merge_sort(array)
    if array.length < 2
        puts "base case"
        return array 
    end
    left = array[0..((array.length-1)/2).round - 1]   
    right = array[((array.length-1)/2).round..array.length-1]

    x = merge_sort(left)
    y = merge_sort(right)

    result = []
    x.each do |x_val|
        y.each do |y_val|
            if x_val > y_val
                result << y_val
            end
        end
    end
    puts result
    result

end

merge_sort([8,7,6,5,4,3,2,1])
