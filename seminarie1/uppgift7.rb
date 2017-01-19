class Integer
  def fib
    case self
      when 1
        1
      when 0
        1
      else
        self-1 + self-2
    end
  end
end
