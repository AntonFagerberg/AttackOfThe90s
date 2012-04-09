class Player
  attr_reader :key1, :key2, :key3, :key4, :name
  attr_accessor :score, :wins

  def initialize(name, key1, key2, key3, key4)
    @name = name
    @key1 = key1
    @key2 = key2
    @key3 = key3
    @key4 = key4
    @score = 0
    @wins = 0
  end

  def update
  end
end