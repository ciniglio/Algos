class RBTree
  def initialize
    @leaf = Node.new(nil, :black)
    @leaf.left = @leaf.right = nil
    @root = @leaf
  end
  
  def insert(value)
    n = Node.new(value)
    n.left = n.right = @leaf
    insert_and_set_parent(n)
  end

  def insert_and_set_parent(node)
    node.parent = find_parent(node)
    if node.parent == nil
      @root = node
      node.color = :black
      return
    end
    
    if node < node.parent
      node.parent.left = node
    else
      node.parent.right = node
    end
    
    recolor(node)
  end

  def find_parent(node)
    n = @root
    while n != nil
      prev = n
      n = node < n ? n.left : n.right
    end
    prev
  end

  def recolor(node)
    g = grandparent(node)

    if (node.parent == nil)
      @root = node
      @root.color = :black
      return
    end
    
    if (node.parent.color == :black)
      return
    end

    n = node
    u = uncle(node)
    g = grandparent(node)
    if (u and u.color == :red)
      n.parent.color = :black
      u.color = :black
      g.color = :red
      recolor(g)
      return
    end

    if n.equal? n.parent.right and n.parent.equal? g.left
      rotate_left n.parent
      n = n.left
    elsif n.equal? n.parent.left and n.parent.equal? g.right
      rotate_right n.parent
      n = n.right
    end


    n.parent.color = :black
    g.color = :red
    if n.equal? n.parent.left
      rotate_right g
    else
      rotate_left g
    end
  end

  def rotate_left(node)
    if node.parent
      p = node.parent
      if node.equal? p.left
        p.left = node.right
      else
        p.right = node.right
      end
    else
      @root = node.right
      @root.parent = nil
    end

    r = node.right

    if node.right.left
      node.right = node.right.left
    else
      node.right = @leaf
    end
    r.left = node
  end
  
  def rotate_right(node)
    if node.parent
      p = node.parent
      if node.equal? p.left
        p.left = node.left
      else
        p.right = node.right
      end
    else
      @root = node.left
      @root.parent = nil
    end
    
    l = node.left

    if node.left.right
      node.left = node.left.right
    else
      node.left = @leaf
    end
    l.right = node
  end

  def grandparent(node)
    return nil unless node.parent
    node.parent.parent
  end

  def uncle(node)
    return nil if grandparent(node) == nil
    if node.parent.equal? grandparent(node).left
      grandparent(node).right
    else
      grandparent(node).left
    end
  end

  def root
    @root
  end

  def to_s
    puts dfs(@root)
  end

  def dfs(node)
    if node
      dfs node.left
      dfs node.right
    end
    puts node
  end

end

class Node
  include Comparable

  attr_accessor :color, :parent
  attr_reader :value, :left, :right

  def left=(node)
    @left = node
    node.parent = self if node
  end

  def right=(node)
    @right = node
    node.parent = self if node
  end

  def initialize(value, color = :red)
    @value = value
    @color = color
  end

  def <=>(anOther)
    if anOther.respond_to? :value
      @value <=> anOther.value
    else
      @value <=> anOther
    end
  end

  def to_s
    "#{@value} :: #{@color}"
  end
end

