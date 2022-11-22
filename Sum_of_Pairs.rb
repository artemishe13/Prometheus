#Sum of Pairs
#https://www.codewars.com/kata/54d81488b981293527000c8f/train/ruby
def sum_pairs(ints, s)
    hash = {}
    ints.each {|key,value| 
    if  hash.include? key
        return [hash[key], key]
    end
    hash[s-key] = key

}   
    return nil
end
print sum_pairs([5, 3, -13, 3, 3, 3, -13, -3, 13, -3], 0)

def sum_pairs(ints, s)
    para,tempInst=[],[ints.delete_at(0)]
    min=ints.length+1
    schetchik=0
    #ints.each {|element| inst.count(element)>=2? ints.delete(element): element}
tempInst.push(ints.delete_at(0))
    while min > 1 && ints[0] != nil 
            while tempInst.count(ints[0]) > 1
                tempInst.count(ints[0]) > 1 ? ints.delete_at(0) : ints[0] 
            end   
                tempInst.count(ints[0]) >= 2 ? ints.delete_at(0) : tempInst.push(ints.delete_at(0))
                 
                #tempInst.count(ints[0]) >= 2 ? ints.delete_at(0) : tempInst.push(ints.delete_at(0)) 
            
       # tempInst.count(ints[0]) >= 2 ? ints.delete_at(0) : tempInst.push(ints.delete_at(0)) 
        #tempInst.count(ints[0]) >= 2 ? ints.delete_at(0) : tempInst.push(ints.delete_at(0))

        #tempInst.push(ints.delete_at(0))
    
        tempInst.length.times {|ii|
            (ii+1).upto(tempInst.length-1) {|i|
            #(tempInst.length-1).downto(ii+1) {|i|
            schetchik +=1
            print "s-#{s} == tempInst[ii]-#{tempInst[ii]}+tempInst[i]-#{tempInst[i]} i#{i}-ii#{ii}<min#{min}\n"
                if s == (tempInst[ii] + tempInst[i]) && i-ii<min 
                    para[0], para[1] = tempInst[ii], tempInst[i]
                    print "s - #{s} == tempInst[ii] = #{tempInst[ii]}+tempInst[i] = #{tempInst[i]} \n"
                    min=i-ii
                end 
            }   
            break if min==1 
            #tempInst.count(ints[0]) >= 2 ? ints.delete_at(0) : ints[0] 
        }   
    end
    print "schetchik = ", schetchik, "<\n"
    print tempInst, "-tempInst\n"
    para[1] == nil ? nil : para
end
    
    
    print sum_pairs([5, 3, -13, 3, 3, 3, -13, -3, 13, -3], 0)
#end