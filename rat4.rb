#! /usr/bin/ruby

#The intent of this program is to rationalize any word to the number four, as in the length of the word,
#length of the number of the length of the word, ... until the number is four.

puts "Give me a word to rationalize! "
word = gets.chomp
wordLen = word.to_s.length

word1 = 'one'.length
word2 = 'two'.length
word3 = 'three'.length
word4 = 'four'.length
word5 = 'five'.length
word6 = 'six'.length
word7 = 'seven'.length
word8 = 'eight'.length
word9 = 'nine'.length
word0 = 'zero'.length

while wordLen != 4
	if wordLen == 1 then
		word = word1
		elsif wordLen == 2 then
				word = word2
		elsif wordLen == 3 then
				word = word3
		elsif wordLen == 5 then
				word = word5
		elsif wordLen == 6 then
				word = word6
		elsif wordLen == 7 then
				word = word7
		elsif wordLen == 8 then 
				word = word8
		elsif wordLen == 9 then
				word = word9
		elsif wordLen == 0 then
				word = word0
	else
#		puts ""
	end
end

puts word
