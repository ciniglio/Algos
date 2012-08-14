class Graph
  attr_accessor :vertices
  
  def initialize
    @vertices = []
  end
    
  def add_vertex(data)
    @vertices << Vertex.new(data)
    return Vertex.new(data)
  end

  def add_edge(v1, v2, cost=nil)
    Edge.new(v1, v2, cost)
  end

  def size
    @vertices.length
  end

  def adjacent? (v1, v2)
    v1.neighbor? v2
  end

end

class Vertex
  attr_accessor :data, :edges

  def initialize(data)
    @data = data
    @edges = []

    # To speed up adjacency lookup, we'll add a hash with neighbors
    # for the vertex
    @neighbors = {}
  end

  def neighbors
    @neighbors.keys
  end

  def neighbor? v1
    !@neighbors[v1].nil?
  end

  def add_edge(edge)
    @edges << edge
    @neighbors[edge.other_end self] = edge
  end
end

class Edge
  attr_accessor :left, :right, :cost

  def initialize(left, right, cost=nil)
    @left = left 
    @right = right
    @cost = cost
    @left.add_edge self
    @right.add_edge self
  end

  def other_end(vertex)
    return @left if vertex == right
    return @right if vertex == left
    return nil
  end

end
