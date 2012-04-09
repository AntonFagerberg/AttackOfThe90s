require "gosu"
require_relative "player"
require_relative "loader"

class Window < Gosu::Window
  def initialize
    $width = 1024
    $height = 768
    $fullscreen = false

    super($width, $height, $fullscreen)
    
    $debug = false
    $window = self
    $window.caption = "Attack Of The 90s!"

    $update = Array.new

    $draw = Array.new

    $players = Array.new
    $players.push Player.new("Anton", Gosu::KbF, Gosu::KbG, Gosu::KbH, Gosu::KbJ) 
    $tick = 0
    @loader = Loader.new
  end

  def update
    @loader.update
    $update.each { |u| u.update }
    $tick += 1

    if $debug
      puts "---------------------------"
      puts "Update size: #{$update.size}"
      puts "Draw size: #{$draw.size}"
      puts "Tick: #{$tick}"
    end
  end

  def draw
    $draw.each { |d| d.draw }
  end

  def button_up(id)
    close if id == Gosu::KbEscape
    #$players.each { |p| p.pressed(id) if id == p.key1 or id == p.key2 or id == p.key3 or id == p.key4 }
  end
end

Window.new.show