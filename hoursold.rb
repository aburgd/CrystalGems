#! /usr/bin/ruby

puts "How old are you?"
years = gets.to_i

days = years * 365
hours = days * 24
minutes = hours * 60
seconds = minutes * 60

puts "You are #{seconds} seconds old."

