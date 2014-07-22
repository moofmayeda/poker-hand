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
  it("checks if a hand has a pair") do
    is_pair(["2H", "2S", "9D", "5H", "6C"]).should(eq(true))
  end
  it("checks if a had does not have any duplicate numbers") do
    is_pair(["13H", "2S", "4D", "5H", "6C"]).should(eq(false))
  end
end
describe("is_three_or_two_pair") do
  it("checks if a hand has a 3 of a kind") do
    is_three_or_two_pair(["13H", "13S", "13D", "5H", "6C"]).should(eq(true))
  end
end
