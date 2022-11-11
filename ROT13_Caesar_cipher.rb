#https://www.codewars.com/kata/530e15517bc88ac656000716/ruby
# ROT13 is a simple letter substitution cipher that replaces a letter with the letter 13 letters after it in the alphabet. ROT13 is an example of the Caesar cipher.
#Create a function that takes a string and returns the string ciphered with Rot13. If there are numbers or special characters included in the string, they should be returned as they are. Only letters from the latin/english alphabet should be shifted, like in the original Rot13 "implementation".
def rot13(string)

    a,aA=[*'97'..'122'],[*'65'..'90']
    13.times{a.push(a.shift);aA.push(aA.shift);}
    #b=a.take(13)+a.drop(13)
    newString=""
    string.length.times {|c| 
    if [*'a'..'z'].include?(string[c]) 
        newString +=a[string[c.to_i].ord-97].to_i.chr
    elsif [*'A'..'Z'].include?(string[c])
        newString +=aA[string[c.to_i].ord-65].to_i.chr
    else
        newString +=string[c]
    end
}
    return newString
  end

  puts "\n",rot13("Crbyr")

