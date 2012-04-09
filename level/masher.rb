class Masher
  def initialize
    $update.push self
    $draw.push self
    @crazy_font = Gosu::Font.new($window, "font/wuwu perspectiva_0.ttf", 128)
    @pixel_font = Gosu::Font.new($window, "font/m04.TTF", 48)
    @pixel_font_big = Gosu::Font.new($window, "font/m04.TTF", 100)
    @score = 0
    @start = $tick
    @wait = $tick + 100
    @push_text = ""
    @random = Random.new
  end

  def button_down(id)
    puts id
  end

  def update
    if @wait < $tick
      $players.each do |p|
        case @push_text
          when 1
            if $window.button_down? p.key1
              @score += 1
              @wait = $tick + 30
            end
            if ($window.button_down? p.key2 or $window.button_down? p.key3 or $window.button_down? p.key4)
              @score -= 1 
              @wait = $tick + 30
            end
          when 2
            if $window.button_down? p.key2
              @score += 1 
              @wait = $tick + 30
            end
            if ($window.button_down? p.key1 or $window.button_down? p.key3 or $window.button_down? p.key4)
              @score -= 1 
              @wait = $tick + 30
            end
          when 3
            if $window.button_down? p.key3
              @score += 1 
              @wait = $tick + 30
            end
            if ($window.button_down? p.key2 or $window.button_down? p.key2 or $window.button_down? p.key4)
              @score -= 1 
              @wait = $tick + 30
            end
          when 4
            if $window.button_down? p.key4
              @score += 1 
              @wait = $tick + 30
            end
            if ($window.button_down? p.key1 or $window.button_down? p.key2 or $window.button_down? p.key3)
              @score -= 1 
              @wait = $tick + 30
            end
        end
      end
    elsif @wait == $tick
      @push_text = @random.rand(4) + 1
    else
      @push_text = ""
    end
  end

  def draw
    @crazy_font.draw("Push the button!", $width / 2 - 350, 50, 1)
    @pixel_font.draw("Score: #{@score}", 50, $height - 100, 1)
    @pixel_font_big.draw(@push_text, $width / 2 - 20, $height / 2 - 75, 1)
  end
end