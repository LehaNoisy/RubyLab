def task3_1(proc)
  ctime = Time.now
  proc.call
  Time.now - ctime
end

proc = Proc.new do
  (1..5000000).each { |v| v }
end

p task3_1(proc)
