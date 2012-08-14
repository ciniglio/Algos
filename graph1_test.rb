require_relative 'graph1'
require 'test/unit'

class TestVertex < Test::Unit::TestCase
  def setup
    @v = Vertex.new(0)
    @v2 = Vertex.new(2)
  end
  
  def test_initialize
    assert_respond_to @v, :edges
    assert @v.edges.length == 0
  end
end

class TestGraph < Test::Unit::TestCase
  def setup
    @g = Graph.new
    @v1 = @g.add_vertex 11
    @v2 = @g.add_vertex 12
  end

  def test_initialize
    assert_respond_to @g, :vertices
    assert_respond_to @g, :add_vertex
    assert_respond_to @g, :add_edge
    assert_respond_to @g, :size
    assert @g.vertices.length == 2
  end

  def test_add_vertex
    @g.add_vertex 11
    @g.add_vertex 12
    assert @g.vertices.length == 4
  end

  def test_add_edge
    e = @g.add_edge @v1, @v2
    assert @v1.edges.length == 1
    assert @v2.edges.length == 1
    assert e.other_end(@v1) == @v2
    assert e.other_end(@v2) == @v1
  end

  def test_adjacent
    assert !(@g.adjacent? @v1, @v2)
    @g.add_edge @v1, @v2
    assert (@g.adjacent? @v1, @v2)
  end
end
