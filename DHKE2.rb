require 'securerandom'
require 'prime'

# Defines class and methods for DHKE
class Diffie
  # Calculates public key
  def self.pk(g, m, a)
    return pk = g ** a % m
  end
  # Calculate shared secret
  def self.ss(pk, m, a)
    return ss = pk ** a % m
  end
end

# Define class and methods to check primality
class Prime
  # Checks if base is prime
  def self.check_base(g)
    if prime?(g)
      return g
    else
      # Generates a random base until one is found to be prime
      while !(prime?(g))
        g = SecureRandom.random_number(100000)
      end
    return g
    end
  end

  def self.check_mod(m)
    if prime?(m)
      return m
    else
      # Generates a random modulo prime until one is found to be prime
      while !(prime?(m))
        m = SecureRandom.random_number(100000)
      end
    return m
    end
  end

  def self.check_secret(a)
    if prime?(a)
      return a
    else
      while !(prime?(a))
        # Asks for another prime if the first is not prime
        puts 'Please enter a prime number: '
        s = Integer(gets.chomp)
        return s
      end
    end
  end
end

# Asks user what they want to calculate
puts 'Do you want to compute a public key, or a shared secret?'
answer = gets.chomp

# Checks the answer
if answer.eql? "public key"
  # Generates a base prime
  puts 'Your shared prime (g):'
  g = SecureRandom.random_number(1000000)
  Prime.check_base(g)
  puts g
  # Generates a modulo prime
  puts 'Your second/modulo prime (p):'
  m = SecureRandom.random_number(1000000)
  Prime.check_mod(m)
  puts g
  # Asks for and checks secret prime
  puts 'Enter your secret prime (a):'
  a = Integer(gets.chomp)
  Prime.check_secret(a)
  #Performs public key calculation
  pk = Diffie.pk(g, m, a)
  puts "Send this to your contact: #{pk}"
elsif answer.eql? "shared secret"
  # Asks for public key
  puts 'Enter the public key from your contact (pk):'
  pk = Integer(gets.chomp)
  # Asks for modulo prime used
  puts 'Enter the second/modulo prime from your contact (p):'
  m = Integer(gets.chomp)
  # Asks for secret prime and checks primality
  puts 'Enter your secret prime (a):'
  a = Integer(gets.chomp)
  Prime.check_secret(a)
  puts a
  # Performs shared secret calculation
  ss = Diffie.ss(pk, m, a)
  puts "Compare this with your contact: #{ss}"
else
  # Quits if answer is invalid
  puts 'Goodbye.'
end
