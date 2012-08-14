def merge(a, b)
  result = []
  until a.empty? do
    i = a.shift
    until b.empty? or i <= b.first do
      result << b.shift
    end
    result << i
  end
  until b.empty? do
    result << b.shift
  end
  result
end

def sort(a)
  return a if a.count == 1
  half = a.count/2
  return merge(sort(a[0..half-1]), sort(a[half..a.count])) 
end
