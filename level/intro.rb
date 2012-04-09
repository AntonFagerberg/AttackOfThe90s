class Intro
  def initialize
    $update.push self
    $draw.push self
    @text = Gosu::Font.new($window, "font/wuwu perspectiva_0.ttf", 128)
    
    @colors = Array.new
    @colors.push Gosu::Color.argb(0xff00ffff) # Aqua
    @colors.push Gosu::Color.argb(0xffff0000) # Red 
    @colors.push Gosu::Color.argb(0xff00ff00) # Green
    @colors.push Gosu::Color.argb(0xff0000ff) # Blue
    @colors.push Gosu::Color.argb(0xffffff00) # Yellow
    @colors.push Gosu::Color.argb(0xffff00ff) # Fuchshia
    @colors.push Gosu::Color.argb(0xff00ffff) # Cyan
    @colors_count = @colors.size - 1

    @wave = 0
  end

  def update
    $players.each do |p|
      $done = ($window.button_down? p.key1 or $window.button_down? p.key2 or $window.button_down? p.key3 or $window.button_down? p.key4)
    end
  end

  def draw
    tock = $tick / 5
    @wave += 0.05
    @text.draw("Attack of the 90s!", $width / 2 - 350, 200 + 50 * Math.sin(@wave), 1, 1, 1, @colors[tock % @colors_count])
  end
end