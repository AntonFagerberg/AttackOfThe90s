class Masher
  def initialize
    $update.push self
    $draw.push self
    @crazy_font = Gosu::Font.new($window, "font/wuwu perspectiva_0.ttf", 128)
    @key_font = Gosu::Font.new($window, "font/TypewriterKeys.ttf", 128)
    @pixel_font = Gosu::Font.new($window, "font/m04.TTF", 48)
    @pixel_font_big = Gosu::Font.new($window, "font/m04.TTF", 100)
    @wait = $tick + 100
    @correct = ""
    @random = Random.new
    @color_false = Gosu::Color.argb(0xffff0000)
    @color_true = Gosu::Color.argb(0xff00ff00)
    @color_none = Gosu::Color.argb(0xff808080)
    @color = Array.new
    @color[0] = @color_none
    @color[1] = @color_none
    @color[2] = @color_none
    @color[3] = @color_none
    @end = $tick + 1000
  end

  def button_down(id)
    puts id
  end

  def wait
    @wait = $tick + 30
    0.upto(3) { |i| @color[i] = @color_none }
  end

  def update
    $done = @end < $tick

    if @wait < $tick
      $players.each do |p|
        case @correct
          when 1
            if $window.button_down? p.key1
              p.score += 1
              wait
            end
            if ($window.button_down? p.key2 or $window.button_down? p.key3 or $window.button_down? p.key4)
              p.score -= 1 
              wait
            end
          when 2
            if $window.button_down? p.key2
              p.score += 1 
              wait
            end
            if ($window.button_down? p.key1 or $window.button_down? p.key3 or $window.button_down? p.key4)
              p.score -= 1 
              wait
            end
          when 3
            if $window.button_down? p.key3
              p.score += 1 
              wait
            end
            if ($window.button_down? p.key1 or $window.button_down? p.key2 or $window.button_down? p.key4)
              p.score -= 1 
              wait
            end
          when 4
            if $window.button_down? p.key4
              p.score += 1 
              wait
            end
            if ($window.button_down? p.key1 or $window.button_down? p.key2 or $window.button_down? p.key3)
              p.score -= 1 
              wait
            end
        end
      end
    elsif @wait == $tick
      @correct = @random.rand(4) + 1
      0.upto(3) { |i| @color[i] = @color_false }
      @color[@correct - 1] = @color_true
    else
      @correct = ""
    end
  end

  def draw
    @crazy_font.draw("Push the button!", $width / 2 - 350, 50, 1)
    1.upto($players.size) { |i| @pixel_font.draw($players[i-1].score, 100 + (i - 1) * ($width - 260) / ($players.size - 1.0), $height - 100, 1) }
    
    @key_font.draw(1, $width / 2 - 300, $height / 2 - 75, 1, 1, 1, @color[0])
    @key_font.draw(2, $width / 2 - 150, $height / 2 - 75, 1, 1, 1, @color[1])
    @key_font.draw(3, $width / 2, $height / 2 - 75, 1, 1, 1, @color[2])
    @key_font.draw(4, $width / 2 + 150, $height / 2 - 75, 1, 1, 1, @color[3])
  end
end