#Isograms
#An isogram is a word that has no repeating letters, consecutive or non-consecutive.
#Implement a function that determines whether a string that contains only letters is an isogram. Assume the empty string is an isogram. Ignore letter case.
#Example: (Input --> Output)
#"Dermatoglyphics" --> true "aba" --> false "moOse" --> false (ignore letter case)
#https://www.codewars.com/kata/54ba84be607a92aa900000f1/train/ruby
def is_isogram(string)
    str=string.downcase.split('')
    alfa = {}
    97.upto(122) {|a| alfa[a.chr] = a.chr }
    str.length.times { |i|
        if alfa.include? str[i]
            alfa[str[i]] += str[i]
            end        
    }
    alfa.each_value {|v| v.size >= 3 ? (return false) : true}
    true
end
print is_isogram("teksT")
