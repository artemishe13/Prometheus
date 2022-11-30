#String incrementer
#Your job is to write a function which increments a string, to create a new string.
#If the string already ends with a number, the number should be incremented by 1.
#If the string does not end with a number. the number 1 should be appended to the new string.
#Examples:
#foo -> foo1
#foobar23 -> foobar24
#foo0042 -> foo0043
#foo9 -> foo10
#foo099 -> foo100
#Attention: If the number has leading zeros the amount of digits should be considered.

def incrementer(input)
    int = []
    str=input.split('')
    (str.length-1).downto(0) { |i|
        if str[i].to_i > 0 || (str[i].to_i == 0 && str[i] == "0")
            int.unshift(str[i])
        elsif str[i].to_i == 0
            break
        end
    }
    int.size > 0 ? str.slice!(str.length-int.size..str.length) : int
    print str, " - str\n"
    print (int.join.to_i+1).to_s.size, " - int slice\n"
    #int = int.slice((int.join.to_i+1).to_s.size+1..int.size)
    print int, " - int\n"
    print (int.join.to_i+1).to_s.size, " - (int.join.to_i+1).to_s.size\n"
    
    int.size > (int.join.to_i+1).to_s.size ? str << int.slice!(0..int.size-(int.join.to_i+1).to_s.size-1) : str
    print str, " - str new\n"
    #int = (int.join.to_i+1).split('')
    str << int.join.to_i+1
    print int, " - int\n"
    str.join
end

puts incrementer("foobar00")

#Good
# input.sub(/\d*$/) { |n| n.empty? ? 1 : n.succ }
#Good2
#  input[/\d\z/] ? input.sub(/(\d+)\z/) { $1.next } : input + '1'
