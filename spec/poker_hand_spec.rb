require("rspec")
require("poker_hand")

describe("is_flush") do
  it("checks if a hand is a flush") do
    is_flush(["2H", "4H", "6H", "8H", "10H"]).should(eq(true))
  end

  it("checks if a hand is not a flush") do
    is_flush(["2H", "4H", "6D", "8H", "10H"]).should(eq(false))
  end
end

describe("is_straight") do
  it("checks if a hand is a straight") do
    is_straight(["2H", "3S", "4D", "5H", "6C"]).should(eq(true))
  end

  it("checks if a hand is not a straight") do
     is_straight(["2H", "7S", "4D", "5H", "6C"]).should(eq(false))
  end
end

describe("is_pair") do
  it("checks if a hand has any pairs") do
    is_pair({13 => 2, 5 => 2, 7 => 1}).should(eq(true))
  end
  it("checks if a had does not have any duplicate numbers") do
    is_pair({13 => 1, 11 => 1, 5 => 1, 7 => 1, 2 => 1}).should(eq(false))
  end
end

describe("is_two_pair") do
  it("checks if a hand has two pairs") do
    is_two_pair({13 => 2, 5 => 2, 7 => 1}).should(eq(true))
  end
end

describe("is_three_of_kind") do
  it("checks if a hand has a 3 of a kind") do
    is_three_of_kind({13 => 3, 5 => 1, 7 => 1}).should(eq(true))
  end

  it("checks if a hand is not a 3 of a kind") do
    is_three_of_kind({13 => 2, 5 => 1, 7 => 1, 8 => 1}).should(eq(false))
  end
end

describe("poker_hand") do
  it("takes a three of a kind and returns its type") do
    poker_hand(["13H", "13S", "13D", "5H", "6C"]).should(eq("three of a kind"))
  end

  it("takes a straight flush and returns its type ") do
    poker_hand(["2H", "3H", "4H", "5H", "6H"]).should(eq("straight flush"))
  end

  it("takes a full house and returns its type") do
    poker_hand(["2H", "2D", "2C", "5H", "5C"]).should(eq("full house"))
  end

  it("takes a crappy hand and tells you it is crap") do
    poker_hand(["2H", "4D", "8C", "10H", "6H"]).should(eq("your hand sucks"))
  end

  it("takes two pairs and returns its type") do
    poker_hand(["2H", "2D", "8C", "8H", "6H"]).should(eq("two pair"))
  end
end

describe("is_four_of_kind") do
  it("checks if a hand has four of a kind") do
    is_four_of_kind({13 => 4, 5 => 1}).should(eq(true))
  end

  it("checks if a hand does not have four of a kind") do
    is_four_of_kind({13 => 3, 5 => 1, 2 => 1}).should(eq(false))
  end
end
