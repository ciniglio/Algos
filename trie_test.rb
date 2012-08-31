require_relative 'trie'
require 'test/unit'

class TrieTester < Test::Unit::TestCase
  def test_me
    assert true
    t = Trie.new
    t.add("ale")
    t.add("are")
    t.add("ard")
  end
end
