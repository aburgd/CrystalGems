nums = (1..100).to_a

for n in nums
  if n % 15 == 0
    puts "FizzBuzz"
  elsif n % 3 == 0
    puts "Fizz"
  elsif n % 5 == 0
    puts "Buzz"
  elsif n % 7 == 0
    puts "Woof"
  else
    puts n
  end
end
