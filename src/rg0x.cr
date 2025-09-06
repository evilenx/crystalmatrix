require "random"

GRAY_SCALE = [232, 235, 237, 240, 245, 250, 254, 255]
CHARS = ('0'..'1').to_a

# Cambia aquí los FPS que desees (ej: 144 para muy fluido, 30 para efecto lento)
FPS = 144
FRAME_TIME = 1.0 / FPS.to_f

def term_size
  width  = (ENV["COLUMNS"]? || `tput cols`.strip).to_i
  height = (ENV["LINES"]?   || `tput lines`.strip).to_i
  {width, height}
end

def clear_screen
  print "\e[2J"
  print "\e[H"
end

def hide_cursor
  print "\e[?25l"
end

def show_cursor
  print "\e[?25h"
end

begin
  hide_cursor
  loop do
    width, height = term_size
    clear_screen
    height.times do
      row = ""
      width.times do
        char = CHARS.sample
        gray = GRAY_SCALE.sample
        row += "\e[38;5;#{gray}m#{char}\e[0m"
      end
      puts row
    end
    sleep FRAME_TIME.seconds
  end
ensure
  show_cursor
end

