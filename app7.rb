#https://www.codewars.com/kata/514b92a657cdc65150000006/solutions/ruby
puts "Variant My "
def solution(number)
    arrCount = []
    arrSolution = []
    sum=0
    number.times {|i| 
        arrCount.push(i) 
        division3, remainder3 = i.divmod(3)
        division5, remainder5 = i.divmod(5)
            if remainder3 == 0 || remainder5 == 0   
                 if division3>=1 || division5>=1
                    sum +=i
                end
            end     
    }
   return sum
end



#print arrCount
puts"====================="
    print solution (10)
#good
def solution2(number)
(2..number).inject(0) {|sum, x| (x % 3 == 0 || x % 5 == 0) ? sum + x : sum}
end
print solution (10)