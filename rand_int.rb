require 'securerandom'
require 'prime'

class Prime
  number = SecureRandom.random_number(1000)
  
  if prime?(number)
    p 'yes'
    p number
  else 
    p 'no'
    p number
  end
end