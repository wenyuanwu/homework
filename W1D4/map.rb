
class Map

  attr_accessor :map

  def initialize(map)
    @map = map
  end

  def assign(key,value)
    key_set = key
    lookup(key)? @map[index(key)] = [key,value] : @map << [key,value]
  end

  def lookup(key)
    key_set = self.key
    key_set.include?(key)
  end

  def remove(key)
    index = index(key)
    p index
    @map.take(index) + @map.drop(index + 1)
  end

  def show
    deep_dup(@map)
  end

  private
  
  def deep_dup(arr)
    arr.map{ |el| el.is_a?(Array) ? deep_dup(el) : el }
  end

  def key
    key = @map.map {|el| el.first}
  end

  def index(value)
    return self.key.index(value)
  end

end
