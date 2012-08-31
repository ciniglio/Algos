class UnionFind

  def initialize(size)
    @a = []
    @sz = []
    (0..size).each do |i|
      @a[i] = i
      @sz[i] = 1
    end
  end

  def find_root(n)
    n = @a[n] while n != @a[n]
    return n
  end

  def find(p, q)
    return find_root(p) == find_root(q)
  end

  def unite(p, q)
    if @sz[p] < @sz[q]
      @a[p] = @a[q]
      @sz[p] += @sz[q]
    else
      @a[q] = @a[p]
      @sz[q] += @sz[p]
    end
  end

end
