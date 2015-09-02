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

  def player_hand_display
    string = ""
    player_hand.cards.each do |card|
      string << card.value
      string << card.suit
      string << " "
    end
    string
  end

  def house_hand_display
    string = ""
    house_hand.cards.each do |card|
      string << card.value
      string << card.suit
      string << " "
    end
    string
  end

  def end_game
    print "#{player_hand_display}, totaling #{player_hand.sum_value} and the house has #{house_hand_display}, totaling #{house_hand.sum_value}"
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
    puts "Player was dealt #{player_hand_display}"
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
        end_game
        print "\n YOU WIN!\n"
      elsif player_hand.sum_value < house_hand.sum_value && house_hand.sum_value > 16
        end_game
        print "\n HOUSE WINS!\n"
      elsif player_hand.sum_value == house_hand.sum_value && house_hand.sum_value > 16
        end_game
        print "\n PUSH!\n"
      else
        stand
      end
    end
    puts "\nWould you like to play again? (Yes/No)"
    new_round = gets.chomp.downcase
    until new_round == "yes" || new_round == "no"
      puts "Please say yes or no"
      new_round = gets.chomp.downcase
    end
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
    print "You have #{player_hand_display}. Your total is #{player_hand.sum_value}\n YOU BUST!"
    else
    puts "You have #{player_hand_display}. Your hand total is now #{player_hand.sum_value}, would you like to hit or stand?"
    decision = gets.chomp.downcase
      if decision == "hit"
        hit
      else
        puts "Player score: " + player_hand.sum_value.to_s
        if player_hand.sum_value > house_hand.sum_value && house_hand.sum_value > 16
          end_game
          print "\n YOU WIN!\n"
        elsif player_hand.sum_value <= house_hand.sum_value && house_hand.sum_value > 16
          end_game
          print "\n HOUSE WINS!\n"
        else
          stand
        end
      end
    end
  end

  def stand
    print "\nYou have #{(player_hand_display)} and the house has #{house_hand_display}, house will hit \n\n"
    print "Press enter for next card flip \n"
    gets.chomp
    house_hand.cards << deck.deal
    if player_hand.sum_value < house_hand.sum_value && house_hand.sum_value <= 21
      end_game
      print "\n HOUSE WINS!\n"
    elsif house_hand.sum_value > 21
      end_game
      print "\n HOUSE BUSTS\n YOU WIN!\n"
    elsif 16 < house_hand.sum_value && house_hand.sum_value <= 21 && player_hand.sum_value > house_hand.sum_value
      end_game
      print "\n YOU WIN!\n"
    elsif 16 < house_hand.sum_value && house_hand.sum_value <= 21 && player_hand.sum_value == house_hand.sum_value
      end_game
      print "\n PUSH!\n"
    else
      stand
    end
  end
end

Blackjack.new.new_game
