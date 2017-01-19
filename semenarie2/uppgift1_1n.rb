class Team
  @@instances = []

  attr_reader :name, :diff

  def initialize(name, f, a)
    @name = name
    @diff = (f.to_i - a.to_i)
    @@instances << self
  end

  def self.all
    @@instances
  end
end

class League

  def initialize(filename)
    begin
      f = File.open(filename, "r")
      f.each_line do |line|
        line.scan(/^\s+\d+.\s(\w*).+\s+(\d+)\s+-\s+(\d+).+$/) { |name, f, a| Team.new(name, f, a) }
      end
    rescue Exception => e
      puts e
    end
  end

  def self.fetch_data
    data = Hash.new
    Team.all.each do |team|
      data[team.name] = team.diff
    end
    return data.sort_by{ |name, diff| diff.abs }
  end

  def self.show_scoreboard
    i = 1
    printf "%4s %-20s %s\n", " ", "Name", "Diff"
    printf "%4s %-20s %s\n", " ", "----", "----"
    fetch_data.each do |item|
      printf "%-4s %-20s %s\n", i, item[0], item[1].abs
      i += 1
    end
  end

  def self.min_diff
    fetch_data.first[0]
  end

end



