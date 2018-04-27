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



