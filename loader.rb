require_relative "level/intro"
require_relative "level/masher"

class Loader
  def initialize
    load_level(Intro)
  end

  def update
    if $done
      load_level(Masher)
    end
  end

  def load_level(level)
    $update = Array.new
    $draw = Array.new
    $done = false
    @current_level = level.new
  end
end