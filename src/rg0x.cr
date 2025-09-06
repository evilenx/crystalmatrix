require "random"

# Paleta de grises en colores ANSI 256 (oscuro a claro)
GRAY_SCALE = [232, 235, 237, 240, 245, 250, 254, 255]

# Parámetros de tamaño usando variables de entorno del terminal
width  = (ENV["COLUMNS"]? || "80").to_i
height = (ENV["LINES"]? || "24").to_i

# Caracteres Matrix
CHARS = ('0'..'1').to_a

loop do
  (0...height).each do
    row = ""
    width.times do
      char = CHARS.sample
      gray = GRAY_SCALE.sample
      row += "\e[38;5;#{gray}m#{char}\e[0m"
    end
    puts row
  end
  sleep 0.03.seconds
  print "\e[#{height}A" # Subir el cursor
end

