load 'constraint_networks.rb'
require 'test/unit' 

class TestConstraintNetworks < Test::Unit::TestCase 

  def test_adder
    a = Connector.new("a") 
    b = Connector.new("b")
    c = Connector.new("c")

    Adder.new(a,b,c)

    a.user_assign(10)             # -- : a got new value: 10
    b.user_assign(5)              # -- : b got new value: 5

    assert_equal(10, a.value) 
    assert_equal(5, b.value)
    assert_equal(15, c.value)

    a.forget_value "user"         # -- : a lost value
    c.user_assign(20)             # -- : c got new value: 20

    assert_equal(20, c.value) 

    b.forget_value "user" 
		a.user_assign(15)
		c.user_assign(30)
		assert_equal(15, a.value)
    assert_equal(30, c.value)
  end 

  def test_multiplier
    a = Connector.new("a")
		b = Connector.new("b")
		c = Connector.new("c")
		Multiplier.new(a, b, c)
		
		a.user_assign(10)
		b.user_assign(5)
		assert_equal(50, c.value) 
		
		a.forget_value "user"
		c.user_assign(20)
		assert_equal(4, a.value)
		
		b.forget_value "user"
		a.user_assign(3)
		c.user_assign(9)
		assert_equal(3, b.value)
  end

  def test_celsius2fahrenheit
		c, f = celsius2fahrenheit
		
		c.user_assign 100
		assert_equal(212, f.value)
		
		c.user_assign 0
		assert_equal(32, f.value)
		
		c.forget_value "user"
		f.user_assign 0
		assert_equal(-18, c.value.round)
  end 

end
