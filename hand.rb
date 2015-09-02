require_relative "card"
require "pry"

class Hand
  attr_accessor :cards

  def initialize(cards = [])
    @cards = cards
  end

  def sum_value
    sum = 0
    ace_in_hand = false
    @cards.each do |card|
      if card.face_card
        # value == "J" || card.value == "Q" || card.value == "K"
        sum += 10
      elsif card.ace?
        ace_in_hand = true
        sum += 1
      else
        sum += card.value.to_i
      end
    end
    sum
    if ace_in_hand && sum <= 11
      sum += 10
    end
    sum
  end

end
