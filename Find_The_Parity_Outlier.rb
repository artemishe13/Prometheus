#Find_The_Parity_Outlier
#https://www.codewars.com/kata/5526fc09a1bbd946250002dc/ruby
#You are given an array (which will have a length of at least 3, but could be very large)
# containing integers. The array is either entirely comprised of odd integers or entirely
# comprised of even integers except for a single integer N. Write a method that takes the
# array as an argument and returns this "outlier" N.

def find_outlier(integers)
    summ,chetN=0
     3.times{|i|summ +=integers[i] % 2}
     summ >= 2 ? chet=0:chet=1
     integers.length.times {|i| integers[i] % 2 == chet ?  (return integers[i]) : i} 


end
print "\n",find_outlier([0,1,2])

#Good
#integers.select{|b| b%2==(integers.slice(0,3).map{|a| a%2}.inject(:+)<2 ? 1 : 0)}[0]