#https://www.codewars.com/kata/5467e4d82edf8bbf40000155
def descending_order(n)
    #arrN=n.to_s.scan(/\d/).map {|i| i.to_i}
    if n==0 
        return n=0 
    end
    
arrN=n.digits
arrPerebora=[]
max,maxIndex=0
nT=""
n.digits.length.times{arrN.length.times{|i| 
    if arrN[i]>=max
        max=arrN[i]
        maxIndex=i
    end 
    }
max=0
arrPerebora.push(arrN[maxIndex])
arrN.delete_at(maxIndex)
}
arrPerebora.length.times{|i|
nT=nT+arrPerebora[i].to_s
}
return nT.to_i
  end


puts
def descending_Order(n)
n.to_s.chars.sort.reverse.join.to_i
end
n=rand(10)**1
50.times {|i|
    print "#{rand(10)**i} "
}
puts n
#puts descending_order(n)
#puts descending_Order(n)
#n.digits.sort.reverse.join.to_i