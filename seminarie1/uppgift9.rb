class Array

  def rotate_left(n=1)
    self.push(self.shift(n)).flatten
  end

end
