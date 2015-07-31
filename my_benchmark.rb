def my_benchmark(repeat)
  start_time = Time.now

  repeat.times do
    yield
  end

  puts (Time.now - start_time).to_s
end

my_benchmark(10000) {puts "hi"}