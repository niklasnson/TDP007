class Person

  attr_writer :score 

  def initialize (manufacturer, postalnumber, license, gender, age)
    @manufacturer = manufacturer
    @postalnumber = postalnumber
    @license = license 
    @gender = gender
    @age = age
    @score = 0
  end

  def evaluate_policy(filename)
    instance_eval(File.new(filename).read())
    #calc
    @score 
  end

  def multiplier(expression, mult)
    if instance_eval(expression) 
      @score = @score * mult
    end
  end

  # http://ruby-doc.org/core-2.3.0/Object.html#method-i-instance_variable_get
  def method_missing(method_name, expression, points)
    begin 
      if instance_variable_defined?("@#{method_name}") 
        if (expression.include?(instance_variable_get("@#{method_name}")))
          @score += points.to_f   
        end
      else
        raise "Error: expression found in policy not used in the model."
      end
    rescue => e
      p e
    end
  end
end

