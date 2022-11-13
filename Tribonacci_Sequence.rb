#Tribonacci Sequence

#Well met with Fibonacci bigger brother, AKA Tribonacci.
#As the name may already reveal, it works basically like a Fibonacci, 
#but summing the last 3 (instead of 2) numbers of the sequence to generate the next. 
#And, worse part of it, regrettably I won't get to hear non-native Italian speakers 
#trying to pronounce it :(
def tribonacci(signature,n)
    if n == 1
        signature.delete_at(-3)
        signature.delete_at(-2)
        return signature
    elsif n==0 
        return []
    elsif signature.length < 3
        return signature
    else 
        (n-3).times {signature.push(signature[-3..-1].sum)}
        return signature
    end
end
def tribonacci2(signature,n)
    (n - signature.size).times { signature << signature.last(3).sum }
    signature[0...n]
end
puts tribonacci([1,1],10)
puts "============="
puts tribonacci2([1,1],10)
#good
#
 # 
