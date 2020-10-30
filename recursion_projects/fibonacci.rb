def fibonacci(num)

    x = 0
    y = 1
    while y < num
        puts y
        x,y = y,x + y
        
        
    end
end

def fibonacci_rec(x = 0, y = 1, num)

    return y if (num <= 0)

    puts y
    x,y = y,x + y
    fibonacci_rec(x,y,num - 1)
   
end

while true
    fibonacci_rec(gets.chomp.to_i)
end