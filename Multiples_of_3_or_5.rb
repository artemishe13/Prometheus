#Multiples of 3 or 5
#https://www.codewars.com/kata/514b92a657cdc65150000006
#If we list all the natural numbers below 10 that are multiples of 3 or 5, 
#we get 3, 5, 6 and 9. The sum of these multiples is 23.
#Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in. Additionally, if the number is negative, return 0 (for languages that do have them).
#Note: If the number is a multiple of both 3 and 5, only count it once.
def multiples(int)
arrInt = []
sum = 0
number.times {|i| arrInt << i}
arrInt.each {|element| element % 3 == 0 || element % 5 == 0 ? sum += element : sum}
sum
end

puts solution(10)

#Good
#(1...number).select {|i| i%3==0 || i%5==0}.inject(:+)
#Good
#(1...number).select{|n| (n % 5).zero? || (n % 3).zero?}.reduce(:+)