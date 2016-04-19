require 'prime'
require 'securerandom'

class Prime
  def self.check_base(g)
    if prime?(g)
      p 'y'
      p g
    else
      p 'n'
      unless prime?(g)
        g = SecureRandom.random_number(100000)
      end
      p g
    end
  end
  
  def self.check_mod(m)
    if prime?(m)
      p 'y'
      p m
    else
      p 'n'
      unless prime?(m)
        m = SecureRandom.random_number(100000)
      end
      p m
    end
  end
end

class Tests
  p 'Testing base: '
  g = SecureRandom.random_number(100000)
  Prime.check_base(g)
  p 'Testing modulo: '
  m = SecureRandom.random_number(100000)
  Prime.check_mod(m)
end
