# Knights Travails

TODO

## Quick Start

### Requirements

- Ruby 3.1.4
- RSpec (optional; only for running tests)

### How to run

```bash
ruby index.rb
```

### How to test

```bash
# if not installed already
gem install rspec

rspec index.spec.rb
```

## Assignment TODOs

- [ ] TODO

## Planning Notes

### PEDAC

- PEDAC: Problem
    - write a function `knight_moves`
    - input:
        - `start_cell`: an 8x8 chess board cell's coordinates
            - `start_cell.size` is 2
            - `start_cell[0]`: row index in range \[0, 7]
            - `start_cell[1]`: col index in range \[0, 7]
        - `end_cell`: an 8x8 chess board cell's coordinates
            - `end_cell.size` is 2
            - `end_cell[0]`: row index in range \[0, 7]
            - `end_cell[1]`: col index in range \[0, 7]
    - output:
        - `res`: sequence of chess board cells that represents the shortest path to get to `end_cell` from `start_cell` as a Knight chess piece
            - includes `start_cell` and `end_cell` cells
            - int 2D array / matrix
            - `res.size` in range \[2, INF]
            - `res[i].size` is 2
            - `res[i][0]` is in range \[0, 7] (the row index)
            - `res[i][1]` is in range \[0, 7] (the col index)
    - other constraints / notes
        - knight cannot move to any cell outside the 8x8 chess board
        - for any cell on the board, knight has up to 8 different valid cells it can move to in 1 turn
        - knight can move an unlimited number of turns
        - assuming that the target cell is valid, a knight's 8 possible moves are the following:
            - `[r - 1, c - 2]`: 2 horiz. lefts -> 1 vert. up
            - `[r + 1, c - 2]`: 2 horiz. lefts -> 1 vert. down
            - `[r - 1, c + 2]`: 2 horiz. rights -> 1 vert. up
            - `[r + 1, c + 2]`: 2 horiz. rights -> 1 vert. down
            - `[r - 2, c - 1]`: 2 vert. ups -> 1 horiz. left
            - `[r - 2, c + 1]`: 2 vert. ups -> 1 horiz. right
            - `[r + 2, c - 1]`: 2 vert. downs -> 1 horiz. left
            - `[r + 2, c + 1]`: 2 vert. downs -> 1 horiz. right
        - don't need a 2D array or matrix to calculate the path
- PEDAC: Examples
    - TODO

### General Notes

- solution 1
    - use backtracking algorithm to generate all possible sequences of valid knight cell moves that reach `end_cell` from `start_cell`
    - use Dijkstra's algorithm to find shortest path from collection of sequences from previous step?
- solution 2: BFS iterative
    - helper function `is_valid_cell?(cell)`
        - `cell` is an int array of size
        - returns true if `cell` is in-bounds else false
    - return empty array if either `start_cell` or `end_cell` are invalid cells
    - initialise variables
        - `queue`: an array of array elements initialised with the element `[start_cell, [start_cell]]`
            - each element is an array where
                - `element[0]` is the cell that we are visiting represented by an int array of size 2
                - `element[1]` is the ordered array of cells from `start_cell` to whichever current cell we are at
        - `visit`: an empty set
            - stores each cell (an int array of size 2) that has been visited
        - `directions`: an int 2D array
            - stores the 8 possible cells represented by row and col diff arrays that the knight can move to
    - while `queue` is not empty
        - `cell`, `path` = pop from front of `queue`
        - if `cell` == `end_cell`
            - return `path` appended with `cell`
        - loop thru each array element `diff` in `directions`
            - `next_cell` = `[cell[0] + diff[0], cell[1] + diff[1]]`
            - if `next_cell` is out-of-bounds, continue
            - if `next_cell` is x, continue
            - if `next_cell` has been visited (in `visit`), continue
            - push `[next_cell, path appended with next_cell]` to `queue`
            - add `next_cell` to `visit` set

