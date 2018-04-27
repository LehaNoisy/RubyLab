class Array
  def odd_methodd
    (self.select! { |i| yield(i) }).reject! { |i| not i % 2 == 0}
  end
end

puts [1, 2, 3, 4, 5, 6, 7].odd_methodd { |i| i > 2}.inspect # => [4, 6]
puts [1, 2, 3, 4, 5, 6, 7].odd_methodd { |i| i > 10}.inspect # => nil
puts [2, 4, 6, 8, 10, 12, 7].odd_methodd {|i| i.between?(6, 12)}.inspect # => [6, 8, 10, 12]
