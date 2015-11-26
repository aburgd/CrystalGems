puts "Are you computing the public key or the shared secret?"
answer = gets.chomp

# beginning of if..else
if answer.downcase.eql? "public key" then
    puts "Enter your shared prime (g): "
    base = Integer(gets.chomp)
    puts "Enter your second prime (p): "
    modPrime = Integer(gets.chomp)
    puts "Enter your secret prime (a): "
    aSecret = Integer(gets.chomp)
    
    puts "Share this with your contact: " + Diffie.publicKey(base, modPrime, aSecret)
    
elsif answer.downcase.eql? "shared secret" then
    puts "Enter the shared secret from your contact (A): "
    publicKey = Integer(gets.chomp)
    puts "Enter your second prime (p) :"
    modPrime = Integer(get.chomp)
    puts "Enter your secret prime (a): "
    aSecret = Integer(gets.chomp)
    
    puts "Compare this with your contact: " + Diffie.shareSecret(publicKey, modPrime, aSecret)
    
else
    puts nil
end

# beginning of dhke class
class Diffie
    @Diffie = nil
    def publicKey(base, modPrime, aSecret)
        
        @publicKey = 0
        
#        puts "Enter your shared prime (g): "
#        base = Integer(gets.chomp)
#        puts "Enter your second prime (p): "
#        modPrime = Integer(gets.chomp)
#        puts "Enter your secret prime (a): "
#        aSecret = Integer(gets.chomp)
        
        @publicKey = base ** aSecret % modPrime
            print "Share this with your contact: " + publicKey
    end
    
    def shareSecret(publicKey, modPrime, aSecret)
        
        @shareSecret = 0
        
#        puts "Enter the shared secret from your contact (A): "
#        publicKey = Integer(gets.chomp)
#        puts "Enter your second prime (p) :"
#        modPrime = Integer(get.chomp)
#        puts "Enter your secret prime (a): "
#        aSecret = Integer(gets.chomp)
        
        @shareSecret = publicKey ** aSecret % modPrime
            print "Compare this with your contact: " + shareSecret
    end

end