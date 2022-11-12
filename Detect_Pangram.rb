#Detect_Pangram
#https://www.codewars.com/kata/545cedaa9943f7fe7b000048/train/ruby
#A pangram is a sentence that contains every single letter of the alphabet at least once.
#For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, 
#because it uses the letters A-Z at least once (case is irrelevant).
def pangram?(string)
   
    string.upcase!
    arrA=[]
   26.times { |i|
   if string.include?([*'A'..'Z'][i])
    arrA.push([*'A'..'Z'][i])
   end
   }
arrA.length == 26
end
print "\n",pangram?("")

#Good
#('a'..'z').all? { |x| string.downcase.include? (x) } 
#string.downcase.scan(/[a-z]/).uniq.size == 26