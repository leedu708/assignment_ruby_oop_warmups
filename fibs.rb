def fibs(element)
  fib_sequence = [0, 1]

  if element == 1
    fib_sequence.pop
  else
    (element - 2).times do |index|
      fib_sequence.push(fib_sequence[index] + fib_sequence[index + 1])
    end
  end

  print fib_sequence.to_s + "\n"
end

fibs(1)