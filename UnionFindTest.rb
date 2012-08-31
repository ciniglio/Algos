require_relative 'UnionFind'
require 'test/unit'

class Tester < Test::Unit::TestCase
  def testme
    u = UnionFind.new(50)
    u.unite(1,2)
    assert u.find(1, 2)
    u.unite(1,2)
    u.unite(3,2)
    u.unite(4,2)
    assert u.find(4, 2)
    assert u.find(4, 1)
    assert u.find(4, 3)

    u.unite(14,32)
    u.unite(24,32)
    u.unite(45,21)
    assert !u.find(1, 21)
    assert u.find(24, 14)
  end
end
