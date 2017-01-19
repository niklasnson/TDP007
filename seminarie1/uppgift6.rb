require 'time'

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

class Person
  def initialize(age=0, name="", surename="")
    @age = age
    @name = PersonName.new(name, surename)
  end

  def birthyear
    Time.new.year-age
  end

  def birthyear=(value)
    @age = Time.new.year-value
  end

  def age
    @age
  end

  def age=(value)
    @age = value
    birthyear = Time.new.year-@age
  end
end
