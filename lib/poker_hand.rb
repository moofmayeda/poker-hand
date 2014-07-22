def poker_hand(hand)
  numbers = [hand[0][0..-2].to_i, hand[1][0..-2].to_i, hand[2][0..-2].to_i, hand[3][0..-2].to_i, hand[4][0..-2].to_i]
  counts = Hash.new 0
  numbers.each do |number|
    counts[number] += 1
  end
  if is_flush(hand) && is_straight(hand)
    return "straight flush"
  elsif is_three_of_kind(counts) && is_pair(counts)
    return "full house"
  elsif is_four_of_kind(counts)
    return "four of a kind"
  elsif is_three_of_kind(counts)
    return "three of a kind"
  elsif is_two_pair(counts)
    return "two pair"
  elsif is_pair(counts)
    return "a pair"
  elsif is_straight(hand)
    return "straight"
  elsif is_flush(hand)
    return "flush"
  else
    return "your hand sucks"
  end
end

def is_flush(hand)
  suits = [hand[0][-1], hand[1][-1], hand[2][-1], hand[3][-1], hand[4][-1]]
  suits.uniq.length == 1 ? true : false
end

def is_straight(hand)
  numbers = [hand[0][0..-2].to_i, hand[1][0..-2].to_i, hand[2][0..-2].to_i, hand[3][0..-2].to_i, hand[4][0..-2].to_i]

  # ASK WHY THIS DOESN'T WORK - Mac solved it below.  Needed another argument
  # numbers.each do |number, index|
  #   number = number.to_i
  #    number[index] = number.to_i
  # end

  numbers.sort!
  numbers.each_cons(2).all? {|x,y| y == x + 1}
end

def is_four_of_kind(counts)
  counts.detect {|key, count| count == 4} != nil
end

def is_three_of_kind(counts)
  counts.detect {|key, count| count == 3} != nil
end

def is_pair(counts)
  counts.detect {|key, count| count == 2} != nil
end

def is_two_pair(counts)
  counts.select {|key, count| count == 2}.length == 2
end
