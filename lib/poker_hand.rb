def poker_hand(hand)

end

def is_flush(hand)
  suits = [hand[0][-1], hand[1][-1], hand[2][-1], hand[3][-1], hand[4][-1]]
  if suits.uniq.length == 1
    return true
  else
    return false
  end
end

def is_straight(hand)
  numbers = [hand[0][0..-2].to_i, hand[1][0..-2].to_i, hand[2][0..-2].to_i, hand[3][0..-2].to_i, hand[4][0..-2].to_i]

  # ASK WHY THIS DOESN'T WORK
  # numbers.each do |number|
  #   number = number.to_i
  # end

  numbers.sort!
  numbers.each_cons(2).all? {|x,y| y == x + 1}
end

def is_three_or_two_pair(hand)
  numbers = [hand[0][0..-2].to_i, hand[1][0..-2].to_i, hand[2][0..-2].to_i, hand[3][0..-2].to_i, hand[4][0..-2].to_i]
  # numbers.uniq.length == 4 ? true : false
  numbers.uniq.length == 3 ? true : false
end

def is_pair(hand)
  numbers = [hand[0][0..-2].to_i, hand[1][0..-2].to_i, hand[2][0..-2].to_i, hand[3][0..-2].to_i, hand[4][0..-2].to_i]
  numbers.uniq.length == 4 ? true : false
end
