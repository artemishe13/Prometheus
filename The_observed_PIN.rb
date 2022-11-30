#The observed PIN
#https://www.codewars.com/kata/5263c6999e0f40dee200059d/train/ruby
#https://www.codewars.com/kata/5263c6999e0f40dee200059d/discuss#label-issue
#Alright, detective, one of our colleagues successfully observed our target person, 
#Robby the robber. We followed him to a secret warehouse, where we assume to find 
#all the stolen stuff. The door to this warehouse is secured by an electronic 
#combination lock. Unfortunately our spy isn't sure about the PIN he saw, when Robby 
#entered it. The keypad has the following layout:

def get_pins(observed)
    # TODO
koding = {
    '1' => ['1', '2', '4'],
    '2' => ['1', '2', '3', '5'],
    '3' => ['2', '3', '6'],
    '4' => ['1', '4', '5', '7'],
    '5' => ['2', '4', '5', '6', '8'],
    '6' => ['3', '5', '6', '9'],
    '7' => ['4', '7', '8'],
    '8' => ['0', '5', '7', '8', '9'],
    '9' => ['6', '8', '9'],
    '0' => ['0', '8']
}
arrKod, arrOBS, arrKodKombo = [], [], []
hash = {}
lengthArr=1
    observed.split('').each { |a|
        koding.each {|key,value| 
        if  a.include? key
        arrKod << value
        lengthArr *= value.size
        end
        }   
    }
    if arrKod.length !=1 
        arrOBS=arrKod[0]
        1.upto(arrKod.length-1) {|item|
            arrOBS.product(arrKod[item]) {|combination| 
            arrOBS << combination.join
            hash[combination.join] = combination
        }
        }
        hash.each_key do |key|
                 key.size == observed.size ? arrKodKombo << key : key
         end
        return arrKodKombo
    else
        arrKod[0].each {|item| arrKodKombo << item}
        return arrKodKombo
    end
end





#Good

def get_pins2(observed)
    mapping = {
      "1" => %w(1 2 4), 
      "2" => %w(1 2 3 5),
      "3" => %w(2 3 6), 
      "4" => %w(1 4 5 7), 
      "5" => %w(2 4 5 6 8), 
      "6" => %w(3 5 6 9), 
      "7" => %w(4 7 8), 
      "8" => %w(5 7 8 9 0), 
      "9" => %w(6 8 9), 
      "0" => %w(8 0)
    }
    observed.split(//).map {|key| mapping[key] }.reduce {|m, x| m.product(x).map(&:join) }
  end

  print get_pins('101'), "-1\n"
  print get_pins2('101'), "-2\n"