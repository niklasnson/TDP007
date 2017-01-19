class String
  def acronym
    self.split.inject('') { |result, word| result += word[0].upcase }
  end
end
