require 'set'

def is_valid_cell?(cell, board_length = 8)
  row, col = cell
  return false if row.class != Integer or col.class != Integer

  row >= 0 && row < board_length && col >= 0 && col < board_length
end

def knights_moves(start_cell, end_cell, board_length = 8)
  return [] if !is_valid_cell?(start_cell) or !is_valid_cell?(end_cell)
  return [start_cell, end_cell] if start_cell == end_cell

  directions = [
    [-1, -2],   # 2 lefts -> 1 up
    [1, -2],    # 2 lefts -> 1 down
    [-1, 2],    # 2 rights -> 1 up
    [1, 2],     # 2 rights -> 1 down
    [-2, -1],   # 2 ups -> 1 left
    [-2, 1],    # 2 ups -> 1 right
    [2, -1],    # 2 downs -> 1 left
    [2, 1]      # 2 downs -> 1 right
  ]
  visit = Set.new                       # set of cells
  queue = [[start_cell, [start_cell]]]  # queue of [cell, path]

  until queue.empty?
    cell, path = queue.shift
    return path if cell == end_cell

    directions.each do |dir|
      new_cell = [cell[0] + dir[0], cell[1] + dir[1]]
      next if !is_valid_cell?(new_cell) or visit.include?(new_cell)

      queue.push([new_cell, [*path, new_cell]])
      visit.add(new_cell)
    end
  end
end
