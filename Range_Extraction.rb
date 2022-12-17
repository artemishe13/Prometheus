#Range Extraction
#Courtesy of rosettacode.org (ALGORITHMS)
#https://www.codewars.com/kata/51ba717bb08c1cd60f00002f/train/ruby
#A format for expressing an ordered list of integers is to use a comma separated list 
#of either
#individual integers or a range of integers denoted by the starting integer separated 
#in the interval including both endpoints. It is not considered a range unless it spans at least 3 numbers. For example "12,13,15-17"
#Complete the solution so that it takes a list of integers in increasing order and
#returns a correctly formatted string in the range format.

def solution(list)
hh = {list[0].to_s => []}
lastKey = list[0]
lastValue = list[0]
1.upto(list.length-1) { |i| 
if  lastValue == list[i]-1
    hh [(lastKey).to_s] = hh [(lastKey).to_s] << list[i].to_s
    lastValue = list[i]
elsif lastValue != list[i]-1
        lastValue = list[i]
           hh [lastValue.to_s] = []
           lastKey = list[i]
end
}
listMin=''
hh.each {|k,v|
if v == []
    listMin = listMin+k.to_s+','
elsif v != [] && v.size>1
    listMin = listMin+k.to_s+'-'+v[v.size-1].to_s+','
elsif v != [] && v.size == 1
    listMin = listMin+k.to_s+','+v[0].to_s+','
end
}
listMin.chop
end
print solution ([-10, -9, -8, -6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20])