string ='hello, 1, 3, 5 cows, 5, 9'
sum = 0

string.each_char do |chars|
 if chars.match(/\d/) != nil
   sum += chars.to_i
 end
 end
 puts string
 puts "Sum=#{sum}"


