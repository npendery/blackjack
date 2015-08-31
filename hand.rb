require_relative "card"
# require_relative "deck"
require "pry"

class Hand
  attr_accessor :cards

  def initialize(cards = [])
    @cards = cards
  end

  def sum_value
    sum = 0
    @cards.each do |card|
      if card.face_card
        # value == "J" || card.value == "Q" || card.value == "K"
        sum += 10
      elsif card.value == "A"
        sum += 11
      else
        sum += card.value.to_i
      end
    end
    sum
  end

  def card_display
    @cards.each do |card|
      print "#{card.value}#{card.suit} "
    end
  end

end
