arr = [1, 2, 3, 4]

def task_3_2(array, digit = 0, &block)
  array.map! { |v| yield v } if block_given?
  array.inject(digit) { |sum, x| sum + x }
end

p task_3_2(arr, 10) { |i| i**2 }
