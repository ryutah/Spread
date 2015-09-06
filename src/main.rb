require_relative 'spread'

spread = Spread.new

while true
  str = gets.strip
  break if str.downcase == 'q'

  commands = str.split ','
  mode = commands.first.to_i
  case mode
  when 0
    row = commands[1].to_i
    col = commands[2].to_i
    obj = commands[3]
    puts spread.set row, col, obj
  when 1
    row = commands[1].to_i
    col = commands[2].to_i
    puts spread.get row, col
  else
    cell = spread.cells
    cell.transpose if spread.inverse
    cell.each do |c|
      charas = c.map do |cel|
        cel || "NULL"
      end
      puts charas.join ', '
    end
  end
end
