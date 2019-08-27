# frozen_string_literal: true

require 'test/unit'
require 'amatch'

class TestMap < Test::Unit::TestCase
  include Amatch

  def setup
    @map = Map.new('PairDistance')
    @map.add('test', 1)
  end

  def test_methods
    assert_respond_to @map, :algorithm
    assert_respond_to @map, :patterns
    assert_respond_to @map, :add
    assert_respond_to @map, :find
    assert_respond_to @map, :delete
  end

  def test_add
    assert_include @map.patterns.keys, 1
  end

  def test_find
    assert_equal 1, @map.find('test')[0][1]
  end

  def test_delete
    assert_empty @map.delete(1)
  end
end
