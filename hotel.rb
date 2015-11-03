#! /usr/bin/ruby

puts "Are you at the hotel?"

resp = gets.to_str.downcase

if resp == 'yes'
	puts "There you are."
else	
	10.times { puts resp }
end
