#Split Strings
#"1,2,3,4".split(",",2)
#=>["1", "2", "3", "4"]

# "1,2,3,4".split(",").map { |s| s.to_i }
#=>[1, 2, 3, 4]

#"12345".split('').map(&:to_i)
#=>[1,2,3,4,5]
def solution(str)
arrA=str.split('')
arrB=[]
arrA.length%2==1? arrA.push('_'):arrA
(arrA.length/2).times {|i|
arrB << arrA.join[0.2,2]
arrA.slice!(0..1)
}
arrB
end
print solution("ab123456d7896")

#Creazy
#(str + '_').scan /../
#################
#str.concat('_').scan /../
#####################

#Good
#str << "_" if str.length % 2 != 0
#str.chars.each_slice(2).map(&:join)
#########################
#str.chars.each_slice(2).map { |d| d.length == 2 ? d.join : d.join+'_' }
