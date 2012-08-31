class Trie
  attr_accessor :root
  def initialize
    @root = Hash.new
  end

  def add(str)
    node = root
    str.each_char do |ch|
      if node[ch].nil?
        node[ch] = Hash.new
      else
        # node[ch] = node[ch]
      end
      node = node[ch]
    end
    puts root
  end
end
