(1..20).inject(1) { |result, element | result * element }

def faculty(n)
  if n > 0
    (1..n).inject(1) { |result, element | result * element }
  end
end
