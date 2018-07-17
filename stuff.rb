class Space
  def initialize(value = 0, display_value = '-')
    @value = value
    @display_value = display_value
  end

  def value
    @value
  end

  def display_value
    @display_value
  end

  def set_value_x
    @value = 1
    @display_value = 'X'
  end

  def set_value_o
    @value = 2
    @display_value = 'O'
  end
end


class Board
  def initialize(array)
    @array = array
  end
  def print_board
    puts '+1---+2---+3---+'
    puts '|  0 |  0 |  0 |'
    puts '+4---+5---+6---+'
    puts '|  0 |  0 |  0 |'
    puts '+7---+8---+9---+'
    puts '|  0 |  0 |  0 |'
    puts '+----+----+----+'
  end
  def space_value(num)
    @array.to_a[num]
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

s1a = Space.new
s2a = Space.new
s3a = Space.new
s1b = Space.new
s2b = Space.new
s3b = Space.new
s1c = Space.new
s2c = Space.new
s3c = Space.new

column1 = Line.new([s1a.value, s1b.value, s1c.value])
column2 = Line.new([s2a.value, s2b.value, s2c.value])
column3 = Line.new([s3a.value, s3b.value, s3c.value])

row1 = Line.new([s1a.value, s2a.value, s3a.value])
row2 = Line.new([s1b.value, s2b.value, s3b.value])
row3 = Line.new([s1c.value, s2c.value, s3c.value])

diagonal1 = Line.new([s1a.value, s2b.value, s3c.value])
diagonal2 = Line.new([s1c.value, s2b.value, s3a.value])

game_board = Board.new( [[s1a, s2a, s3a], [s1b, s2b, s3b], [s1c, s2c, s3c]])
game_board.print_board

class Input
  def initialize(input)
    @input = input
  end
  def get_input
    puts 'Select where player X will put an X (type a number between 1 and 9)'
    @input = gets.chomp
  end
end

class Counter
  def initialize(count = 0)
    @count = count
  end
  def add
    @count += 1
  end
end

turn = Counter.new(0)

5.times do

  puts 'Select where player X will put an X (type a number between 1 and 9)'

  loop do
    input_X = gets.chomp

    if input_X.to_i == 1
      s1a.set_value_x
      break
    elsif input_X.to_i == 2
      s2a.set_value_x
      break
    elsif input_X.to_i == 3
      s3a.set_value_x
      break
    elsif input_X.to_i == 4
      s1b.set_value_x
      break
    elsif input_X.to_i == 5
      s2b.set_value_x
      break
    elsif input_X.to_i == 6
      s3b.set_value_x
      break
    elsif input_X.to_i == 7
      s1c.set_value_x
      break
    elsif input_X.to_i == 8
      s2c.set_value_x
      break
    elsif input_X.to_i == 9
      s3c.set_value_x
      break
    else
      puts 'Type a whole number between 1 and 9 please'
    end
  end

  loop do
    if column1.complete? == true ||
       column2.complete? == true ||
       column3.complete? == true ||
       row1.complete? == true ||
       row2.complete? == true ||
       row3.complete? == true ||
       diagonal1.complete? == true ||
       diagonal2.complete? == true
      puts 'someone has won'
      break
    else
      break
    end
  end

  game_board.print_board

  puts 'Select where player O will put an O (type a number between 1 and 9)'

  loop do
    input_O = gets.chomp

    if input_O.to_i == 1
      s1a.set_value_o
      break
    elsif input_O.to_i == 2
      s2a.set_value_o
      break
    elsif input_O.to_i == 3
      s3a.set_value_o
      break
    elsif input_O.to_i == 4
      s1b.set_value_o
      break
    elsif input_O.to_i == 5
      s2b.set_value_o
      break
    elsif input_O.to_i == 6
      s3b.set_value_o
      break
    elsif input_O.to_i == 7
      s1c.set_value_o
      break
    elsif input_O.to_i == 8
      s2c.set_value_o
      break
    elsif input_O.to_i == 9
      s3c.set_value_o
      break
    else
      puts 'Type a whole number between 1 and 9 please'
    end
  end

  loop do
    if column1.complete? == true ||
       column2.complete? == true ||
       column3.complete? == true ||
       row1.complete? == true ||
       row2.complete? == true ||
       row3.complete? == true ||
       diagonal1.complete? == true ||
       diagonal2.complete? == true
      puts 'someone has won'
      break
    else
      break
    end
  end

  game_board.print_board

end