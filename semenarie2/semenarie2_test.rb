# coding: utf-8

require 'test/unit'
require './uppgift1_1n.rb'

class TestUppgifter < Test::Unit::TestCase

  def test_uppgift1
    assert_equal("Aston_Villa", League.new("football.txt").class.min_diff)
  end


  def test_uppgift2
  end

  def test_uppgift3
  end

end