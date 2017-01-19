# coding: utf-8
require './uppgift1'
require './uppgift2'
require './uppgift3'
require './uppgift4'
require './uppgift5'
require './uppgift6'
require './uppgift7'
require './uppgift8'
require './uppgift9'
require './uppgift10'
require './uppgift11'
require './uppgift12'

require 'test/unit'

class TestUppgifter < Test::Unit::TestCase

  def test_uppgift1
    assert_equal(3, n_times(3){ nums =+ 1})
    nums = -1
    n_times(3) { nums += 1 }
    assert_not_equal(nums, -1)

    z = Repeat.new(3)
    v = 2
    z.each { v += 1 }
    assert_equal(v, 5)

  end

  def test_uppgift2
    assert_equal( 2432902008176640000, faculty(20) )
    assert_equal( 120, faculty(5) )
    assert_equal( 2, faculty(2) )
  end

  def test_uppgift3
    assert_equal( "apelsin", longest_string( ["apelsin", "banan", "citron"] ) )
    assert_equal( "ab", longest_string( ["a", "b", "ab"] ) )
    assert_equal( "ab", longest_string( ["ab", "ac", "ad"] ) )
  end

  def test_uppgift4
    data = ["abc","abcd","abcde","abcdef"]
    assert_equal( "abcdef", find_it(data){ |a,b| a.length > b.length } )
    assert_equal( "abc", find_it(data){ |a,b| a.length < b.length } )
  end

  def test_uppgift5
    person = PersonName.new("Niklas", "Nilsson")
    person2 = PersonName.new("Johan", "Borgenstierna")
    assert_equal( "Niklas Nilsson", person.fullname )
    assert_equal( "Johan Borgenstierna", person2.fullname )
  end

  def test_uppgift6
    someone = Person.new(41, "Niklas", "Nilsson")

    someone.birthyear=1984
    assert_equal( 32, someone.age )
    assert_equal( 1984, someone.birthyear )
    
    someone.age = 10
    assert_equal( 10, someone.age )
    assert_equal( 2006, someone.birthyear )
  end

  def test_uppgift7
    assert_equal( 1, 0.fib )
    assert_equal( 1, 1.fib )
    assert_equal( 11, 7.fib )
    assert_equal( 197, 100.fib )
  end

  def test_uppgift8
    assert_equal( "LOL", "lauf ooout loud".acronym )
    assert_equal( "WTF", "water the foot".acronym )
    assert_equal( "åäö", "åhej äpå ödig".acronym ) # å blir inte Å (upcase)
    assert_equal( "ROFL", "rotating omelette flying lake".acronym )
  end

  def test_uppgift9
    assert_equal( [2,3,1], [1,2,3].rotate )
    assert_equal( [2,3,1], [1,2,3].rotate(1) )
    assert_equal( [3,1,2], [1,2,3].rotate(2) )
  end

  def test_uppgift10
    assert_equal( "NikLas", find_user("jsa USERNAME: NikLas") )
    assert_equal( "JuHan", find_user("USER USERNAME:JuHan") )
    assert_equal( "ABC", find_user("::: USERNAME:     ABC") )
  end

  def test_uppgift11
    html = "<html><head><title></title></head></html>"
    html2 = "<html not-working='naah..'><div div div><p></html>"
    
    assert_equal( [["html"],["head"],["title"]], tag_names(html) )
    assert_equal( [["p"]], tag_names(html2) )
  end

  def test_uppgift12
    assert_equal( "FMA297", regnr("Min bil heter FMA297") )
    assert_equal( "KUK666", regnr("KUK666") ) # i verklighet inte godkänt
    assert_equal( false, regnr("Min bil heter FMQ123") )
    assert_equal( false, regnr("brumbrum DMI123 blabla") )
    assert_equal( false, regnr("bilen:  asdasddFMV123asdasd") )
  end
end
