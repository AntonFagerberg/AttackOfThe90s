require_relative "intro"

class Loader
  def initialize
    load_level(Intro)
  end

  def update
    if $done
      load_level(Intro)
    end
  end

  def load_level(level)
    $update = Array.new
    $draw = Array.new
    $done = false
    @current_level = level.new
  end
end