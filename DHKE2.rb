require 'securerandom'
require 'prime'

class Prime
  def self.check_base(g)
    if prime?(g)
      return g
    else
      while !(prime?(g))
        g = SecureRandom.random_number(100000)
      end
    return g
    end
  end

  def self.check_mod(p)
    if prime?(p)
      return p
    else
      while !(prime?(p))
        p =SecureRandom.random_number(100000)
      end
    return p
    end
  end

  def self.check_secret(s)
    if prime?(s)
      return s
    else
      while !(prime?(s))
        p 'Please enter a prime number: '
        s = Integer(gets.chomp)
        return s
      end
    end
end

class Diffie
  def self.publicKey(g, m, a)
    # Use check_prime method as defined in Prime class for $base and $mod
    Prime.check_prime($base)
    Prime.check_prime($mod)
    # Do the math to find the public key
    publicKey = g ** a % m
  end

  def self.sharedSecret(publicKey, mod, aSecret)
    # Do the math to find the shared secret
    sharedSecret = publicKey ** aSecret % $mod
  end

  # Ask for which number to find
  p 'Are you computing a public key, or a shared secret?'
  answer = gets.chomp.downcase

  # Check the answer
  # Finding a public key
  if answer.eql? "public key"
    # Put randomly generated base prime
    p 'Your shared prime (g) is:'
    p $base
    # Put randomly generated modulo prime
    p 'Your modulo prime (p) is:'
    p $mod
    # Ask for secret prime
    p 'Enter your secret prime (a):'
    aSecret = Integer(gets.chomp)
    # Use secret_prime method as defined in Prime class to check primality
    # of secret prime
    Prime.secret_prime(aSecret)
    # Run publicKey method from Prime class
    publicKey = Diffie.publicKey($base, $mod, aSecret).to_s
    p 'Share this with contact: ' + publicKey

  # Finding a shared secret
  elsif answer.eql? "shared secret"
    # Ask for public key sent
    p 'Enter the public key (A) sent to you:'
    publicKey = gets.chomp
    # Ask for shared modulo prime
    p 'Enter the modulo prime (p) sent to you:'
    mod = Integer(gets.chomp)
    # Ask for secret prime
    p 'Enter your secret prime (a):'
    aSecret = Integer(gets.chomp)
    # Use secret_prime method as defined in Prime class to check primality
    # of secret prime
    Prime.secret_prime(aSecret)
    # Run sharedSecret method from Prime class
    sharedSecret = Diffie.sharedSecret(publicKey, $mod, aSecret)
    # Put sharedSecret to compare
    p 'Compare this with your contact: ' + sharedSecret
  end
end
