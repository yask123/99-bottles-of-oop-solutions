class Bottles
  def verse(bottles)
    verse = <<-VERSE
#{number_of_bottles(bottles, true)} of beer on the wall, #{number_of_bottles(bottles)} of beer.
#{take_down_number(1, bottles)}, #{number_of_bottles(bottles - 1)} of beer on the wall.
    VERSE
  end

  def verses(bottle_one, bottle_two)
    result = ''
    (bottle_one.step(bottle_two, -1)).each do |bottle_number|
      result += verse(bottle_number) + "\n"
    end
    result.chomp
  end

  def song
    verses(99,0)
  end

  def number_of_bottles(number, capitalize_first_word = false)
    if number == 0
      if capitalize_first_word
        'No more bottles'
      else
        'no more bottles'
      end
    elsif number == 1
      '1 bottle'
    elsif number < 0
      '99 bottles'
    else
      "#{number} bottles"
    end
  end


  def take_down_number(down_bottle, total_bottles)
    remaining_bottles = total_bottles - down_bottle
    if remaining_bottles == 0
      return 'Take it down and pass it around'
    elsif remaining_bottles < 0
      'Go to the store and buy some more'
    else
      return 'Take one down and pass it around'
    end
  end
end
