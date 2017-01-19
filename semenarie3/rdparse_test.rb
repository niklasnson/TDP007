require_relative "rdparse"
require "test/unit"

class TestLogic < Test::Unit::TestCase

  def test_parser 

    logic = Logic.new
    logic.log(false)

    logic.parse("(set a true)")
    assert(logic.parse("a"))

    logic.parse("(set b false)")
    assert_false(logic.parse("b"))

    logic.parse("(set c a)")
    assert(logic.parse("c"))

    logic.parse("(set d (not true))")
    assert_false(logic.parse("d"))

    logic.parse("(set e (not false))")
    assert(logic.parse("e"))

    logic.parse("(set f (and false true))")
    assert_false(logic.parse("f"))

    logic.parse("(set g (and true false))")
    assert_false(logic.parse("g"))

    logic.parse("(set h (or true false))")
    assert(logic.parse("h"))

    logic.parse("(set i (or false true))")
    assert(logic.parse("i"))

    logic.parse("(set z 1)")
    assert_same(Fixnum, logic.vars["z"].class)
    assert_equal(1, logic.vars["z"])

    assert_same(TrueClass, logic.parse("a").class)
    assert_same(FalseClass, logic.parse("b").class)

    logic.roll!

  end

end 
