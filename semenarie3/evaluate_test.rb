require './evaluate' 
require 'test/unit'

class Evaluate < Test::Unit::TestCase

  def test_evaluate_policy
    assert_equal(26.4, Person.new("volvo", "58937", 2, "kvinna", 74).evaluate_policy('policy.rb'))
    assert_instance_of(Float, Person.new("volvo", "58937", 2, "kvinna", 74).evaluate_policy('policy.rb'))
    assert_not_equal(0, Person.new("volvo", "58937", 2, "kvinna", 74).evaluate_policy('policy.rb'))
  end

end



