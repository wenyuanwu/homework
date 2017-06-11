#517

class Code
  attr_reader :pegs
  attr_accessor :arr

  PEGS = {
    'R' => :red,
    'B' => :blue,
    'Y' => :yellow,
    'G' => :green,
    'O' => :orange,
    'P' => :purple
          }

  def self.parse(str)
    size = str.size
    str.each_char do |ch|
      raise StandardError.new unless PEGS.keys.include?(ch.upcase)
    end
    raise StandardError.new if size > 4
    Code.new(str.downcase.split(""))
  end

  def self.random
    arr = PEGS.keys.shuffle.take(4)
    Code.new(arr)
  end

  def initialize(pegs)
    @pegs = pegs
  end

  def [](num)
    @pegs[num]
  end

  def exact_matches(code)
    count = 0
    self.pegs.size.times {|i| count += 1 if self.pegs[i] == code.pegs[i]}
    count
  end

  def near_matches(code)
    code_hash = Hash.new(0)
    self_hash = Hash.new(0)

    code.pegs.each do |peg|
      code_hash[peg] += 1
    end

    self.pegs.each do |peg|
      self_hash[peg] += 1
    end

    sum = 0
    self_hash.keys.each do |key|
      if code_hash.keys.include?(key)
        sum += 1
      end
    end

    sum - self.exact_matches(code)
  end

  def ==(code)
    return false unless code.is_a?(Code)
    self.exact_matches(code) == code.pegs.size ? true : false
  end

end

class Game
  attr_reader :secret_code

  def initialize(*code)
    @secret_code = code[0] || Code.random
  end

  def get_guess
    input = gets.chomp
    Code.parse(input)
  end

  def display_matches(code)
    print /code.exact_matches(secret_code)/
    print /code.near_matches(secret_code)/
  end
end
