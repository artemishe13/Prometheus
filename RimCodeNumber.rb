@rimNumber=[
    ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"], 
    ["X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"],
    ["C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"],
    ["M", "MM", "MMM", "MMMM"]
]

#number=1666
#number="MDCLXVI"
#arrNumber=Number.to_s

#Number.match?(/\A-?\d+\Z/)

#Calculating Roman Numerals
def to_roman (number)
    arrNumber=number.to_s.split('').map(&:to_i)
    #Change the array to 4x if the number was less
    arrNumber.length.upto(3) {arrNumber.unshift(0)}
    rim=""
    iteraciya=0
    @rimNumber.reverse.each do |item| 
            (item.length-1).downto(0) do |i_t| 
                if i_t+1 == arrNumber[iteraciya] 
                    rim +=item[i_t]
                end
            end
        iteraciya +=1
        end
        rim
end
#================================================
#Calculating Arabic numerals
def from_roman (number)
    #newNumber=number
    #arrRim=[]
    rim=0
    factor=1
    @rimNumber.each do |item|
       # (item.length-1).downto(0) do |i_t| 
       (item.length-1).downto(0) do |i_t| 
#puts "item[i_t] = #{item[i_t]}"
            if number.include?(item[i_t])  
                if number.include?(item[3])==false
                #print "item[i_t]=#{item[i_t]} i_t=#{i_t+1}\n"
                number=number.gsub(item[i_t], ((i_t+1)*factor).to_s) 
                #puts "number=#{number}"
                rim +=(i_t+1)*factor

                else
                    number=number.gsub(item[3], ((i_t)*factor).to_s) 
                    rim +=(i_t)*factor
                end

                #item[0] != item[i_t]?
                #number.include?(item[i_t-1])==false
                #print "item[i_t]#{item[i_t]}+item[i_t+1]#{item[i_t+1]}=#{item[i_t]+item[i_t+1]}\n"
                #if number.include?(item[i_t]+item[i_t+1])
                #    number
                #else
                #    number = number.gsub(item[i_t], ((i_t)*factor).to_s) 
                #end
                #number.include?(item[i_t-1])? arrRim.push((i_t)*factor) : arrRim.push((i_t+1)*factor)


                #print item[i_t], " =item[i_t] ", item[i_t-1], " = item[i_t-1] ", i_t, " =i_t \n "
            end
        

        end
    factor *=10
end
print "number=",number,"\n"
#print "newNumber=",newNumber
rim
end
puts to_roman (1656)
puts from_roman ('MCMXCIV')
