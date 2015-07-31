def My_reverse(input)
  input = input.chars.to_a

  (input.length / 2).times do |index|
    temp = input[index]
    input[index] = input[-(index + 1)]
    input[-(index + 1)] = temp
  end

  input.join
end

puts My_reverse("Dustin")