require_relative 'redblack'
require 'test/unit'

class TestTree < Test::Unit::TestCase
  def setup
    @t = RBTree.new
  end

  def test_creation 
    assert @t.root == nil
  end

  def test_insert
    @t.insert(0)
    assert @t.root == 0
  end

  def test_find_parent
    @t.insert(0)
    n = Node.new(1)
    assert @t.find_parent(n) == 0
  end

  def test_invariant_one
   (1..150).each do
     @t.insert(Random.rand(1..100))
     assert @t.root.color == :black
   end
  end

  def test_one_rotation_right
    @t.insert(64)
    @t.insert(55)
    @t.insert(39)
    @t.insert(8)
    assert @t.root.color == :black
  end

  def test_one_internal_right
    @t.insert(62) #root
    @t.insert(37) #left
    @t.insert(100) #right
    @t.insert(88) # uncle and parent red so make parent and gp black
    @t.insert(76) # rotate right on 100
    @t.insert(74)
    @t.insert(89)
    assert @t.root.color == :black
  end

  def test_one_rotation_left
    @t.insert(17)
    @t.insert(48)
    @t.insert(72)
    @t.insert(26)
    assert @t.root.color == :black
  end

  def test_one_internal_rotation
    @t.insert(91)
    @t.insert(81)
    @t.insert(48)
    @t.insert(80)
    assert @t.root.color == :black
  end


end

class TestRotation < Test::Unit::TestCase
  def setup
    #####
    #                     0
    #             -4             4
    #         -5      -2      2    5
    #

    @t = RBTree.new
    @t.insert(0)
    @n = Node.new(-4)
    @t.root.left = @n
    @t.root.left.left = Node.new(-5)
    @t.root.left.right = Node.new(-2)
    @t.root.right = Node.new(4)
    @t.root.right.right = Node.new(5)
    @t.root.right.left = Node.new(2)
  end
  
  def test_rotate_left
    @t.rotate_left(@n)
    assert @t.root.left == -2
    assert @t.root.left.left == -4
  end

  def test_rotate_right
    @t.rotate_right(@n)
    assert @t.root.left == -5
    assert @t.root.left.right == -4
  end
end

class TestNode < Test::Unit::TestCase
  def setup
    @n = Node.new(1)
    @m = Node.new(4)
    @o = Node.new(7)
  end

  def test_compare
    assert @n < @m
    assert @o > @m
    assert Node.new(4) == @m
    assert @n == 1
    assert Node.new(nil) == nil
  end
end
