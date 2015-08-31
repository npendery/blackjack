#!/usr/bin/env ruby

# YOUR CODE HERE
require_relative "deck"
require_relative "card"
require_relative "hand"
require "pry"

class Blackjack
  attr_reader :deck, :player_hand, :house_hand
  def initialize
    @deck = Deck.new
    @player_hand = Hand.new
    @house_hand = Hand.new
  end

  def display(array)
    array.each do |card|
      print "#{@value}#{@suit} "
    end
  end

  def new_game

    deck = @deck
    player_hand = @player_hand
    house_hand = @house_hand

    player_hand.cards << deck.deal
    house_hand.cards << deck.deal
    player_hand.cards << deck.deal
    house_hand.cards << deck.deal

    puts "\nWelcome to Blackjack!"
    player_hand.cards.each do |card|
      puts "Player was dealt #{card.value} #{card.suit}"
    end
    puts "Player score: " + player_hand.sum_value.to_s
    puts "Your hand total is #{player_hand.sum_value}, would you like to hit or stand?"
    decision = gets.chomp.downcase
    until decision == "hit" || decision == "stand"
      puts "Please enter either hit or stand"
      decision = gets.chomp.downcase
    end
    if decision == "hit"
      hit
    elsif decision == "stand"
      if player_hand.sum_value > house_hand.sum_value && house_hand.sum_value > 16
        print "You have #{player_hand.card_display} and the house has #{house_hand.card_display}, you win!"
      elsif player_hand.sum_value <= house_hand.sum_value && house_hand.sum_value > 16
        print "You have #{player_hand.card_display} and the house has #{house_hand.card_display}, house wins!"
      else
        stand
      end
    end
    puts "\nWould you like to play again? (Yes/No)"
    new_round = gets.chomp.downcase
    if new_round == "yes"
      player_hand.cards = []
      house_hand.cards = []
      if @deck.stack.count > 4
        new_game
      else
      puts "Sorry, end of the deck!"
      end
    else
      puts "Come back anytime!"
    end
  end

  def hit
    player_hand.cards << deck.deal
    if player_hand.sum_value > 21
    print "Your total is #{player_hand.sum_value}, you bust!"
    else
    puts "Your hand total is now #{player_hand.sum_value}, would you like to hit or stand?"
    decision = gets.chomp.downcase
      if decision == "hit"
        hit
      else
        puts "Player score: " + player_hand.sum_value.to_s
        if player_hand.sum_value > house_hand.sum_value && house_hand.sum_value > 16
          print "You have #{player_hand.card_display} and the house has #{house_hand.card_display}, you win!"
        elsif player_hand.sum_value <= house_hand.sum_value && house_hand.sum_value > 16
          print "You have #{player_hand.card_display} and the house has #{house_hand.card_display}, house wins!"
        else
          stand
        end
      end
    end
  end

  def stand
    print "\nYou have #{display(player_hand.card_display)} and the house has #{house_hand.card_display}, house will hit \n\n"
    print "Press enter for next card flip \n"
    gets.chomp
    house_hand.cards << deck.deal
    if player_hand.sum_value < house_hand.sum_value && house_hand.sum_value <= 21
      print "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_hand.card_display}, totaling #{house_hand.sum_value}, house wins!"
    elsif house_hand.sum_value > 21
      print "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_hand.card_display}, totaling #{house_hand.sum_value}, house busts, you win!"
    elsif 16 < house_hand.sum_value && house_hand.sum_value <= 21 && player_hand.sum_value > house_hand.sum_value
      print "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_hand.card_display}, totaling #{house_hand.sum_value}, you win!"
    else
      stand
    end
  end
end

Blackjack.new.new_game
