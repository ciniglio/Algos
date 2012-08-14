require_relative 'graph1'
require 'test/unit'

class TestVertex < Test::Unit::TestCase
  def setup
    @v = Vertex.new(0)
    @v2 = Vertex.new(2)
  end
  
  def test_initialize
    assert_respond_to @v, :num_edges
    assert_respond_to @v, :neighbors
    assert_respond_to @v, :neighbor?
    assert @v.num_edges == 0
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
    assert @v1.num_edges == 1
    assert @v2.num_edges == 1
    assert e.other_end(@v1) == @v2
    assert e.other_end(@v2) == @v1
  end

  def test_adjacent
    assert !(@g.adjacent? @v1, @v2)
    @g.add_edge @v1, @v2
    assert (@g.adjacent? @v1, @v2)
  end

  def test_large_adjacent
    for n in 0..50
      @g.add_vertex n
    end

    for vertex in @g.vertices
      for vertex_2 in @g.vertices
        unless vertex == vertex_2
          @g.add_edge vertex, vertex_2 
          assert (@g.adjacent? vertex, vertex_2)
        end
      end
    end
  end

  def test_neighbors
    v3 = @g.add_vertex 13
    v4 = @g.add_vertex 14
    @g.add_edge @v1, v3
    @g.add_edge @v1, v4
    
    assert @v1.neighbors.include? v3
    assert @v1.neighbors.include? v4
    assert v3.neighbors.include? @v1
    assert v4.neighbors.include? @v1
  end

  def test_delete_edge
    @g.add_edge @v1, @v2
    assert @v2.neighbor? @v1
    @g.delete_edge @v1, @v2
    assert !(@v2.neighbor? @v1)
  end
end
