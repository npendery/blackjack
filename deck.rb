require_relative "card"
require_relative "hand"
require "pry"

SUITS = ["♠", "♥", "♦", "♣"]
VALUES = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]

class Deck
  attr_reader :stack
  
  def initialize
    @stack = []
    SUITS.each do |suit|
      VALUES.each do |value|
        @stack << Card.new(value, suit)
      end
    end
    @stack.shuffle!
  end

  def deal
    @stack.pop
  end
end

#
# deck = Deck.new
#
# new_hand = Hand.new
#
# 2.times do
#   new_hand.cards << deck.deal
# end
#
# binding.pry
#
# puts "hi"
