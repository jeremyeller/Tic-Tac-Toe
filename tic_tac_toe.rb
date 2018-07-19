class Counter
  def initialize(num = 1)
    @num = num
  end

  def num
    @num
  end

  def add
    @num += 1
  end
end

class Space
  def initialize(value = 0)
    @value = value
  end

  def value
    @value
  end

  def display_value
    if @value == 0
      '-'
    elsif @value == 1
      'X'
    elsif @value == 2
      'O'
    end
  end

  def set_value(x_or_o)
    @value = x_or_o
  end
end

class Line
  def initialize(array)
    @array = array
  end
  def spaces
    @array
  end
  def complete?
    @array[0].value == @array[1].value && @array[0].value == @array[2].value && @array[0].value != 0
  end
end


class Board
  def initialize(array)
    @array = array
    @column1 = Line.new([@array[0][0], @array[1][0], @array[2][0]])
    @column2 = Line.new([@array[0][1], @array[1][1], @array[2][1]])
    @column3 = Line.new([@array[0][2], @array[1][2], @array[2][2]])

    @row1 = Line.new([@array[0][0], @array[0][1], @array[0][2]])
    @row2 = Line.new([@array[1][0], @array[1][1], @array[1][2]])
    @row3 = Line.new([@array[2][0], @array[2][1], @array[2][2]])

    @diagonal1 = Line.new([@array[0][0], @array[1][1], @array[2][2]])
    @diagonal2 = Line.new([@array[0][2], @array[1][1], @array[2][0]])
  end
  def print_board
    puts '+1---+2---+3---+'
    puts "|  #{@array[0][0].display_value} |  #{@array[0][1].display_value} |  #{@array[0][2].display_value} |"
    puts '+4---+5---+6---+'
    puts "|  #{@array[1][0].display_value} |  #{@array[1][1].display_value} |  #{@array[1][2].display_value} |"
    puts '+7---+8---+9---+'
    puts "|  #{@array[2][0].display_value} |  #{@array[2][1].display_value} |  #{@array[2][2].display_value} |"
    puts '+----+----+----+'
  end
  def check_complete
    @column1.complete? ||
    @column2.complete? ||
    @column3.complete? ||

    @row1.complete? ||
    @row2.complete? ||
    @row3.complete? ||

    @diagonal1.complete? ||
    @diagonal2.complete?
  end
  def position(num)
    if num == 1
      @array[0][0]
    elsif num == 2
      @array[0][1]
    elsif num == 3
      @array[0][2]
    elsif num == 4
      @array[1][0]
    elsif num == 5
      @array[1][1]
    elsif num == 6
      @array[1][2]
    elsif num == 7
      @array[2][0]
    elsif num == 8
      @array[2][1]
    elsif num == 9
      @array[2][2]
    else
      nil
    end
  end
end

class Game
  def initialize
    spaces = [[Space.new, Space.new, Space.new], [Space.new, Space.new, Space.new], [Space.new, Space.new, Space.new]]
    @game_board = Board.new(spaces)
    @turn_counter = Counter.new
  end
  def turn
    loop do
      @game_board.print_board
      puts "Turn #{@turn_counter.num}"
      input = gets.chomp.to_i
      if @game_board.position(input) != nil
        if @game_board.position(input).value == 0
          if @turn_counter.num.odd?
            @game_board.position(input).set_value(1)
          else
            @game_board.position(input).set_value(2)
          end
          @turn_counter.add
          if @game_board.check_complete
            puts 'YAY THE GAME IS OVER'
            @game_board.print_board
            exit
          else
            next
          end
          break
        else
          puts 'Type the number of an empty space please'
        end
      else
        puts 'Type a whole number between 1 and 9 please'
      end
    end
  end
end

game = Game.new

loop do
  game.turn
end