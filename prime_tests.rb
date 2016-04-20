require 'prime'
require 'securerandom'

class Prime
  def self.check_base(g)
    if prime?(g)
      p 'y'
      p g
    else
      while !(prime?(g))
        g = SecureRandom.random_number(100000)
	p g
      end
    end
  end
  
  def self.check_mod(m)
    if prime?(m)
      p 'y'
      p m
    else
      unless prime?(m)
        m = SecureRandom.random_number(100000)
	p m
      end
    end
  end
end

class Tests
  p 'Testing base: '
  g = SecureRandom.random_number(100000)
  Prime.check_base(g)
end
