#Create Phone Number
#https://www.codewars.com/kata/525f50e3b73515a6db000b83/train/ruby
#Write a function that accepts an array of 10 integers (between 0 and 9), 
#that returns a string of those numbers in the form of a phone number.
def create_phone_number(numbers)
    #TODO
    str=[]
    str << "(" << numbers.slice(0..2) << ") " << numbers.slice(3..5) << "-" << numbers.slice(6..9)
    str.join
  end

  print create_phone_number([1, 2, 3, 4, 5, 6, 7, 8, 9, 0])

  #Good
  #'(%d%d%d) %d%d%d-%d%d%d%d' % array
  #good
  #"(%d%d%d) %d%d%d-%d%d%d%d" % numbers
  #Nice
  #  n = numbers.join
  #"(#{n[0..2]}) #{n[3..5]}-#{n[6..9]}"
  #Good
  #n.join.gsub(/(^\d{3})(\d{3})(\d+$)/, '(\1) \2-\3')