class Diffie

    def self.publicKey(base, modPrime, aSecret)
        publicKey = base ** aSecret % modPrime
    end
    
    def self.shareSecret(publicKey, modPrime, aSecret)
        shareSecret = publicKey ** aSecret % modPrime
    end

end

puts "Are you computing the public key or the shared secret?"
answer = gets.chomp

if answer.downcase.eql? "public key" then
    puts "Enter your shared prime (g): "
    base = Integer(gets.chomp)
    puts "Enter your second prime (p): "
    modPrime = Integer(gets.chomp)
    puts "Enter your secret prime (a): "
    aSecret = Integer(gets.chomp)

    puts "Share this with your contact: " + Diffie.publicKey(base, modPrime, aSecret).to_s + "\n"
    
elsif answer.downcase.eql? "shared secret" then
    puts "Enter the shared secret from your contact (A): "
    publicKey = Integer(gets.chomp)
    puts "Enter your second prime (p) :"
    modPrime = Integer(gets.chomp)
    puts "Enter your secret prime (a): "
    aSecret = Integer(gets.chomp)
    
    puts "Compare this with your contact: " + Diffie.shareSecret(publicKey, modPrime, aSecret).to_s + "\n"

else
    puts "Goodbye."

end
