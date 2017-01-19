def n_times(n, &block)
  n.times do
    yield
  end
end

class Repeat
  def initialize(n)
    @n = n
  end

  def each(&block)
    @n.times do
      yield
    end
  end
end
