def fibs(element)
  fib_sequence = [0, 1]
  
  if element == 1
    puts "[0]"
    exit
  elsif element == 2
    print fib_sequence.to_s + "\n"
    exit
  end

  (element - 2).times do |index|
    fib_sequence.push(fib_sequence[index] + fib_sequence[index + 1])
  end

  print fib_sequence.to_s + "\n"
end

fibs(15)