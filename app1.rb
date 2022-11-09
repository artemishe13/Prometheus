#1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153 true
value=1532
print "Variant My "
#Count number (of digits in a number)
countValue=value.to_s.length
arrCount = Array.new(countValue.to_i){value.digits}
narcis=0
countValue.times do |i|
narcis=narcis+value.digits[i]**countValue
end
puts narcis==value 
print "Variant 2 "
#array = value.digits
  
  sum = 0
  value.digits.each{|num| sum += num**value.digits.count}
  puts value == sum

  print "Variant 3 "
  sum = 0
  value.digits.each {|x| sum += x**value.digits.length}
  puts sum == value
#def narcissistic?(value)
# Code me to return true or false



