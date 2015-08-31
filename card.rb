# require_relative "deck"
require_relative "hand"
require "pry"

class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def face_card
    ["J", "Q", "K"].include?(@value)
  end

end
