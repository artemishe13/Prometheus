#system 'cls'
balans=1000
puts "Turn on circle Fortune"
puts "One click 1E"
puts "How many clicks to make?: " 
#manyClicks=gets.to_i
manyClicks=1000
arrCount = Array.new(9){123456789.digits}
if manyClicks <= balans 
    1.upto(manyClicks) do |y|
        balans -=1
        x=rand(100..1000)
        10.times do |num|
            sum = 0
            arrCount[num]
            sum=num+num*10+num*100
        #arrCount.each{|num| sum=num+num*10+num*100} 
        if x==sum
        puts "You Win #{x}E, wits like #{y}"
        balans +=x
        puts "You balance #{balans}"
        end
    end
    end
end
puts "Go ti WIN withs you balance #{balans}"
puts
#puts arrCount.each{|num| num=num+num*10+num*100} 