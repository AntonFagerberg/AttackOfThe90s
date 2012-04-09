require_relative "level/intro"
require_relative "level/winner"
require_relative "level/masher"

class Loader
  def initialize
    load_level(Intro)
  end

  def update
    if $done
      if @current_level.class == Winner or @current_level.class == Intro
        load_level(Masher)
      else
        load_level(Winner)
      end
    end
  end

  def load_level(level)
    $update = Array.new
    $draw = Array.new
    $done = false
    @current_level = level.new
    $players.each { |p| p.score = 0 } if @current_level.class != Winner
  end
end