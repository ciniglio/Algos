class LinkedListNode
  attr_accessor :data, :next
end

class LinkedList
  attr_accessor :head

  def insert_data_at_front data
    node = LinkedListNode.new
    node.data = data
    insert_node_at_front node
  end

  def insert_node_at_front node
    node.next = @head
    @head = node
  end

  def find data
    current_node = @head
    while !current_node.nil?
      if current_node.data == data
        return current_node
      end
      current_node = current_node.next
    end
    
    return nil
  end

  def find_previous data
    current_node = @head
    previous_node = nil
    while !current_node.nil?
      if current_node.data == data
        return previous_node
      end
      previous_node = current_node
      current_node = current_node.next
    end
    
    return nil
  end

  def delete data
    @head = @head.next if @head.data == data
    previous_node = find_previous data
    unless previous_node.nil?
      previous_node.next = previous_node.next.next
    end
    
    return @head
  end
end

class Stack
  
  def initialize
    @list = LinkedList.new
  end

  def push data
    @list.insert_data_at_front data
  end

  def pop
    return nil if @list.head.nil?
    value = @list.head.data
    @list.delete value
    return value
  end
end
