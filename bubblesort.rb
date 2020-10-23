def bubble_sort(array)
  sorted = true
  array.each_index do |index|
    if array[index + 1] != nil && array[index] > array[index + 1]
      array[index], array[index + 1] = array[index + 1], array[index]
      sorted = false
    end
  end
  print array
  puts ' '
  bubble_sort(array) if sorted == false
end

bubble_sort([2, 1, 5, 9, 1])
