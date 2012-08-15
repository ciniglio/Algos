class Heap

  def initialize
    @heap = []
  end

  def insert data
    @heap << data
    bubble_up @heap.length - 1
  end

  def bubble_up i
    parent = (i-1)/2

    # max heap (children should be smaller than parents)
    # also, don't forget to not go to index -1
    unless @heap[i] < @heap[parent] or parent < 0
      swap i, parent
      bubble_up parent
    end
  end

  def bubble_down i
    child_left = 2*i + 1
    child_right = 2*i + 2
    
    if @heap.length == 0
      return
    end

    if @heap[child_left] and @heap[i] < @heap[child_left] and
       (!@heap[child_right] or @heap[child_left] >= @heap[child_right])
      swap i, child_left
      bubble_down child_left
    elsif @heap[child_right] and @heap[i] < @heap[child_right] and
          (!@heap[child_left] or @heap[child_right] >= @heap[child_left])
      swap i, child_right
      bubble_down child_right
    end
  end

  def delete_root
    return if size == 0
    swap 0, size - 1
    ret = @heap.delete_at size - 1
    bubble_down 0
    return ret
  end

  def max
    delete_root
  end

  def swap i1, i2
    tmp = @heap[i1]
    @heap[i1] = @heap[i2]
    @heap[i2] = tmp
  end

  def size
    @heap.size
  end

  def empty?
    @heap.size == 0
  end
end
end
