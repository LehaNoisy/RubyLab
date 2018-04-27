# Task 1
def task3_1(proc)
  ctime = Time.now
  proc.call
  Time.now - ctime
end

proc = Proc.new do
  (1..5000000).each { |v| v }
end


# Task 2

def task_3_2(array, digit = 0, &block)
  array.map! { |v| yield v } if block_given?
  array.inject(digit) { |sum, x| sum + x }
end


# Task 3
def task_3_3(range)
  range = range.to_a
  b = range.find_all { |e| e % 7 == 3 }
  b.min
end


# Task 4
def task_3_4(arg1, arg2, *args)
  if block_given? then notness = args.each { yield }
  else
    puts "ERROR"
  end
  notness.each { |i| puts i }
end


# Task 5
class Array
  def even_numbers
    even_arr = self.select{ |v| v.even? }
    if even_arr.empty?
      return nil
    elsif block_given?
      return even_arr.select! { |v| yield(v) }
    else
      return even_arr
    end
  end
end

task_3_5([1, 2, 3, 4, 5, 6, 7]) { |i| i > 2} # => [4, 6]
task_3_5([1, 2, 3, 4, 5, 6, 7]) { |i| i > 10}.inspect # => []
task_3_5([2, 4, 6, 8, 10, 12, 7]) { |i| i.between?(6, 12) } # => [6, 8, 10, 12]











