#Regex_validate_PIN_code
#https://www.codewars.com/kata/55f8a9c06c018a0d6e000132/train/ruby
#ATM machines allow 4 or 6 digit PIN codes and PIN codes cannot contain anything but exactly 4 digits or exactly 6 digits.
def validate_pin(pin)
    #return true or false
    #pin.to_s!
  (pin.size == 6 || pin.size == 4) && (pin.count("0-9") == 4 || pin.count("0-9") == 6) && (pin.count("0-9")==pin.size)
   end
 puts validate_pin(" 1236 ")

 #goood
 #[4, 6].include?(pin.size) && pin.delete("0-9") == ""
 #pin.downcase.count("a-z") > 0 || pin.count("0-9") <4 || pin.count("-") > 0 ? false : (pin.size == 4 || pin.size == 6)