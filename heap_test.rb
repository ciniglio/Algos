require 'test/unit'
require './heap'

class TestHeap < Test::Unit::TestCase
  def setup
    @h = Heap.new
  end

  def test_init
    assert @h
    assert_respond_to @h, :insert
    assert_respond_to @h, :max
  end

  def test_insert
    @h.insert 25
    assert @h.max == 25
    @h.insert 26
    assert @h.max == 26
    @h.insert 24
    assert @h.max == 24
    @h.insert 23
    @h.insert 25
    @h.insert 27
    @h.insert 26
    assert @h.max == 27
    assert @h.max == 26
  end

  def test_heapsort
    a = [0,4,6,7,3,2,1,5,3]
    b = heapsort a
    assert a.sort == b.reverse
  end
  
end
