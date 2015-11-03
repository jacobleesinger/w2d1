require "io/console"


# summary of changes made to implement cursor
# slight changes to cursorable#update_pos to match our board size
# display
# renamed @cursor @cursor_pos to match cursorable
# added move_cursor method
# refactored #render and created #build_grid #build_row, and #colors_for methods to mirror the cursor game's display
# call #move_cursor on start
# board
# added bracket methods

module Cursorable
  KEYMAP = {
    " " => :space,
    "h" => :left,
    "j" => :down,
    "k" => :up,
    "l" => :right,
    "w" => :up,
    "a" => :left,
    "s" => :down,
    "d" => :right,
    "\t" => :tab,
    "\r" => :return,
    "\n" => :newline,
    "\e" => :escape,
    "\e[A" => :up,
    "\e[B" => :down,
    "\e[C" => :right,
    "\e[D" => :left,
    "\177" => :backspace,
    "\004" => :delete,
    "\u0003" => :ctrl_c,
  }

  MOVES = {
    left: [0, -1],
    right: [0, 1],
    up: [-1, 0],
    down: [1, 0]
  }

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  def handle_key(key)
    case key
    when :ctrl_c
      exit 0
    when :return, :space
      @cursor_pos
    when :left, :right, :up, :down
      update_pos(MOVES[key])
      nil
    else
      puts key
    end
  end

  def read_char
    STDIN.echo = false
    STDIN.raw!

    input = STDIN.getc.chr
    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil
      input << STDIN.read_nonblock(2) rescue nil
    end
  ensure
    STDIN.echo = true
    STDIN.cooked!

    return input
  end

  def update_pos(diff)
    row = @cursor_pos[0] + diff[0]
    col =  @cursor_pos[1] + diff[1]
    @cursor_pos = [row, col] if row.between?(0, 7) && col.between?(0, 7)
  end
end
