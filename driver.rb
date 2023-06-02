require_relative 'index'

start_pos = [3,3]
end_pos = [4,3]
res = knights_moves(start_pos, end_pos)

puts("> knight_moves(#{start_pos.to_s},#{end_pos.to_s})")
puts("=> You made it in #{res.size - 1} moves! Here's your path:")
res.each {|cell| puts("  #{cell.to_s}")}
