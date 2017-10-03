class Methods

  List_array = ["array_each_example", "light_speed", "class_stuff", "add"]

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
