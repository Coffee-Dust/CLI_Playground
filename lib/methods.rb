class Methods

  List_array = ["array_each_example", "light_speed", "class_stuff", "add", "play_ttt"]

  def array_each_example
    place = "place"
    longitude = "longitude"
    latitude = "latitude"
    location_array = [
      ["Flatiron School", 10293.123123, 12341.123332],
      ["Home", 10293321.123123, -12341.123332]

    ]
    location_array.each do |place, longitude, latitude|
      puts "The place is: #{place}, cords are: #{longitude} - #{latitude}"
    end
    return true
  end

  def light_speed
    $loop = true

    number_of_ticks = 0

    Thread.new do

      sleep(1)
      puts "Im Done Sleipin'"
      $loop = false

    end

    while $loop
      puts "number at #{number_of_ticks}\n\n"
      number_of_ticks += 1

    end

    puts "I counted to #{number_of_ticks} considering the speed of light"
    puts "is 299 792 458 m/s I failed you :("
    return true
  end


  def list
    puts '
       +--------------+
       |.------------.|
       ||>_          ||
       ||>_1         ||
       ||            ||
       ||            ||
       |+------------+|
       +-..--------..-+
       .--------------.
       / /============\ \\
      / /==============\ \\
     /____________________\\
     \____________________/ '
    List_array.each do |item|
      puts item + "\n"
    end
    return true
  end

  def class_stuff
    joules = Person.new
    puts "Hi #{joules.name}!"
    puts "What do you want to change the name too?"
    input = gets.strip
    joules.name = input
    puts "Hi #{joules.name}!"

  end

  def add
    puts "Just type the numbers you want added! (Put spaces in between em)"
    input = gets.strip
    array = input.split
    #puts array[0].to_i + array[1].to_i + array[2].to_i + array[3].to_i
    sum = 0
    length = array.length / 2
    length.times do
      i = 0
      i_2 = 1
      sum += array[i].to_i + array[i_2].to_i
      i += 1
      i_2 += 1
    end
    puts "Your total is: #{sum}"
  end

  def play_ttt
    puts "Welcome to Tic Tac Toe!"
    game = TicTacToe.new
    game.display_board

    game.play
  end

end #end_class

class Person

  def initialize(first_name="Coffee", last_name="Dust")
    @first_name = first_name
    @last_name = last_name
  end

  def name=(full_name)
    first_name, last_name = full_name.split
    @first_name = first_name
    @last_name = last_name
  end

  def name
    return "#{@first_name} #{@last_name}".strip
  end

end #end_class

#--------Tic Tac Toe Logic n Stuff---------#

class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  #horizontal
  [0,1,2],
  [3,4,5],
  [6,7,8],
  #vertical
  [0,3,6],
  [1,4,7],
  [2,5,8],
  #diagonal
  [0,4,8],
  [2,4,6]
]

  def play
    if won?
      winner
    elsif draw?
      puts "Cat's Game!"
    end

    while !over?
      turn
      if won?
        winner
      elsif draw?
        puts "Cat's Game!"
      end
    end
  end

  def turn_count
    turns = 0
    @board.each do |item|
      if item != "" && item != " " && item != nil
        turns += 1
      end
    end
    return turns
  end

  def current_player
    value = turn_count
    value.even? ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      puts "Wrong/Used Input! You and your earphones will suffer now!"
      sleep(2)
      `afplay /Users/coffeecomputer/Music/RandomSounds/ouch.mp3 --volume 500`
      turn
    end
  end

  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0, 8)
      return true
    else
      return false
    end
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    user_input = input.to_i
    return user_input - 1
  end

  def move(index, char="X")
    @board[index] = char
    display_board
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def won?
    WIN_COMBINATIONS.each do |win|
      pos_1 = @board[win[0]]
      pos_2 = @board[win[1]]
      pos_3 = @board[win[2]]
      if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
        return win
      elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
        return win
      end
    end
    return false
  end

  def full?
    return @board.all? { |item|
      item == "X" || item == "O"
    }
  end

  def draw?
    if won? != false
      return false
    elsif full?
      return true
    end
  end

  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end

  def winner
    if won? != false
      win_i = Array(won?)

      if @board[win_i[0]] == "X" && @board[win_i[1]] == "X" && @board[win_i[2]] == "X"
        puts "Congratulations X!"
        `say "Player O lost. You Stoopid!"`
        `afplay /Users/coffeecomputer/Music/RandomSounds/roast.mp3 --volume 0.5`
        return "X"
      elsif @board[win_i[0]] == "O" && @board[win_i[1]] == "O" && @board[win_i[2]] == "O"
        puts "Congratulations O!"
        `say "Player X lost. You Stoopid!"`
        `afplay /Users/coffeecomputer/Music/RandomSounds/roast.mp3 --volume 0.5`
        return "O"
      else
        return nil
      end
    end
  end

end #end_class

class Rage
  def run(entrys)

    if entrys == 5
    puts "                                          .
                                          `.

                                     ...
                                        `.
                                  ..
                                    `.
                            `.        `.
                         ___`.\.//
                            `---.---
                           /     \.--
                          /       \-
                         |   /\    \
                         |\==/\==/  |
                         | `@'`@'  .--.
                  .--------.           )
                .'             .   `._/
               /               |     \
              .               /       |
              |              /        |
              |            .'         |   .--.
             .'`.        .'_          |  /    \
           .'    `.__.--'.--`.       / .'      |
         .'            .|    \\     |_/        |
       .'            .' |     \\               |
     .-`.           /   |      .      __       |
   .'    `.     \   |   `           .'  )      \
  /        \   / \  |            .-'   /       |
 (  /       \ /   \ |                 |        |
  \/         (     \/                 |        |
  (  /        )    /                 /   _.----|
   \/   //   /   .'                  |.-'       `
   (   /(   /   /                    /      `.   |
    `.(  `-')  .---.                |    `.   `._/
       `._.'  /     `.   .---.      |  .   `._.'
              |       \ /     `.     \  `.___.'
              |        Y        `.    `.___.'
              |      . |          \         \
              |       `|           \         |
              |        |       .    \        |
              |        |        \    \       |
            .--.       |         \           |
           /    `.  .----.        \          /
          /       \/      \        \        /
          |       |        \       |       /
           \      |    @    \   `-. \     /
            \      \         \     \|.__.'
             \      \         \     |
              \      \         \    |
               \      \         \   |
                \    .'`.        \  |
                 `.-'    `.    _.'\ |
                   |       `.-'    ||
              .     \     . `.     ||      .'
               `.    `-.-'    `.__.'     .'
                 `.                    .'
             .                       .'
              `.
                                           .-'
                                        .-'

      \                 \
       \         ..      \
        \       /  `-.--.___ __.-.___
`-.      \     /  #   `-._.-'    \   `--.__
   `-.        /  ####    /   ###  \        `.
________     /  #### ############  |       _|           .'
            |\ #### ##############  \__.--' |    /    .'
            | ####################  |       |   /   .'
            | #### ###############  |       |  /
            | #### ###############  |      /|      ----
          . | #### ###############  |    .'<    ____
        .'  | ####################  | _.'-'\|
      .'    |   ##################  |       |
             `.   ################  |       |
               `.    ############   |       | ----
              ___`.     #####     _..____.-'     .
             |`-._ `-._       _.-'    \\\         `.
          .'`-._  `-._ `-._.-'`--.___.-' \          `.
        .' .. . `-._  `-._        ___.---'|   \   \
      .' .. . .. .  `-._  `-.__.-'        |    \   \
     |`-. . ..  . .. .  `-._|             |     \   \
     |   `-._ . ..  . ..   .'            _|
      `-._   `-._ . ..   .' |      __.--'
          `-._   `-._  .' .'|__.--'
              `-._   `' .'
                  `-._.'
 "

  `afplay ./lib/rageScream.mp3`
  $failed_entrys = 0
end
end

  end
