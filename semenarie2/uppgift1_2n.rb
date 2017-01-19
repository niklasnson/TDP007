class Day
  @@instances = []

  attr_reader :dy, :diff

  def initialize(dy, mnt, mxt)
    @dy = dy
    @diff = (mnt.to_i - mxt.to_i)
    @@instances << self
  end

  def self.all
    @@instances
  end

end


class Parser
  def initialize(filename)
    f = File.open(filename, "r")
    f.each_line do | line |
      line.scan(/^\s+(\d+)\s+(\d+)\s+(\d+).*$/) { |dy, mnt, mxt| Day.new(dy, mnt, mxt) }
    end
  end

  def self.fetch_data
    data = Hash.new
    Day.all.each do | item |
      data[item.dy] = item.diff
    end
    return data.sort_by { |dy, diff | diff}
  end


  def self.as_table
    printf "%-20s %s\n", "Day", "Diff"
    printf "%-20s %s\n", "---", "----"
    fetch_data.each do |item|
      printf "%-20s %s\n", item[0], item[1]
    end
  end

  def self.min_diff
    puts fetch_data.sort_by{ |name, diff | diff.abs }.first[0]
  end
end

Parser.new("weather.txt").class.as_table
Parser.new("weather.txt").class.min_diff