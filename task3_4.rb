def task_3_4(arg1, arg2, *args)
  if block_given? then notness = args.each { yield }
  else
    puts "ERROR"
  end
  notness.each { |i| puts i }
end
task_3_4(255, 2331, 1, 2, 3) { |i| puts i }
