class PersonName
  def initialize(name, surename)
    @name = name
    @surename = surename
  end

  def fullname
    "#{@name} #{@surename}"
  end

  def fullname=(data)
    names = data.split
      @name = names[0]
      @surename =names[1]
  end
end
