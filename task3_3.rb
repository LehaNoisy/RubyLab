def task_3_3(range)
  range = range.to_a
  b = range.find_all { |e| e % 7 == 3 }
  b.min
end

puts task_3_3(100..555)
