require_relative "deck"
require_relative "card"
require_relative "hand"
require "pry"

puts "Welcome to Blackjack!"

deck = Deck.new

player_hand = Hand.new

house_hand = Hand.new

player_hand.cards << deck.deal
house_hand.cards << deck.deal
player_hand.cards << deck.deal
house_hand.cards << deck.deal

# binding.pry

# def hit
#   player_hand.cards << deck.deal
#   if player_hand.sum_value > 21
#     puts "Your total is #{player_hand.sum_value}, you bust!"
#   else
#     puts "Your hand is now #{player_hand.card_display}, would you like to hit or stand?"
#     decision = gets.chomp.downcase
#   end
# end
#
# def stand
#   if player_hand.sum_value > house_hand.sum_value && house_hand.sum_value > 16
#     puts "You have #{player_hand.card_display} and the house has #{house_view}, you win!"
#   else player_hand.sum_value > house_hand.sum_value && house_hand.sum_value < 16
#     puts "You have #{player_hand.card_display} and the house has #{house_view}, house will hit"
#     house_hand.cards << deck.deal
#     if player_hand.sum_value < house_hand.sum_value && house_hand.sum_value <= 21
#       puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, house wins!"
#     elsif house_hand.sum_value > 21
#       puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, house busts, you win!"
#     elsif 16 <= house_hand.sum_value && house_hand.sum_value <= 21 && player_hand.sum_value > house_hand.sum_value
#       puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, you win!"
#     else
#       puts "You have #{player_hand.card_display} and the house has #{house_view}, house will hit again"
#       house_hand.cards << deck.deal
#       if player_hand.sum_value < house_hand.sum_value && house_hand.sum_value <= 21
#         puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, house wins!"
#       elsif house_hand.sum_value > 21
#         puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, house busts, you win!"
#       elsif 16 <= house_hand.sum_value && house_hand.sum_value <= 21 && player_hand.sum_value > house_hand.sum_value
#         puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, you win!"
#       else
#         puts "You have #{player_hand.card_display} and the house has #{house_view}, house will hit again"
#         house_hand.cards << deck.deal
#         if player_hand.sum_value < house_hand.sum_value && house_hand.sum_value <= 21
#           puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, house wins!"
#         elsif house_hand.sum_value > 21
#           puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, house busts, you win!"
#         elsif 16 <= house_hand.sum_value && house_hand.sum_value <= 21 && player_hand.sum_value > house_hand.sum_value
#           puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, you win!"
#         end
#       end
#     end
#   end
# end

# def display_cards(hand)
#   hand.each do |card|
#     puts "card.value card.suit"
#     binding.pry
#   end
# end
#
# player_hand.card_display = display_cards(player_hand.cards)


player_hand.cards.each do |card|
  puts "Player was dealt #{card.value} #{card.suit}"
end

puts "Player score: " + player_hand.sum_value.to_s
# house_view = house_hand.cards.each do |card|
#   puts "Dealer was dealt #{card.value}#{card.suit} "
# end
house_hand.cards.each do |card|
  puts "Player was dealt #{card.value} #{card.suit}"
end

# binding.pry

# if house_hand.sum_value > 21
#   puts "House busts, you win!"
# elsif house_hand.sum_value == 21
#   puts "House has blackjack, you lose!"
# elsif
puts "Would you like to hit or stand?"
decision = gets.chomp.downcase
# binding.pry
if decision == "hit"
  # hit
  player_hand.cards << deck.deal
  if player_hand.sum_value > 21
  puts "Your total is #{player_hand.sum_value}, you bust!"
  else
  puts "Your hand total is now #{player_hand.sum_value}, would you like to hit or stand?"
  decision = gets.chomp.downcase
  end
elsif decision == "stand"
  # stand
  puts "Player score: " + player_hand.sum_value.to_s

  if player_hand.sum_value > house_hand.sum_value && house_hand.sum_value > 16
    puts "You have #{player_hand.card_display} and the house has #{house_view}, you win!"
  elsif player_hand.sum_value > house_hand.sum_value && house_hand.sum_value < 16
    puts "You have #{player_hand.card_display} and the house has #{house_view}, house will hit"
    house_hand.cards << deck.deal
    if player_hand.sum_value < house_hand.sum_value && house_hand.sum_value <= 21
      puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, house wins!"
    elsif house_hand.sum_value > 21
      puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, house busts, you win!"
    elsif 16 <= house_hand.sum_value && house_hand.sum_value <= 21 && player_hand.sum_value > house_hand.sum_value
      puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, you win!"
    end
  end
else
  puts "Please answer with hit or stand"
end
# end

      # else
      #   puts "Your hand is now #{player_hand.card_display}, would you like to hit or stand?"
      #   decision = gets.chomp.downcase
        # if decision == "hit"
        #   player_hand.cards << deck.deal
        #   if player_hand.sum_value > 21
        #     puts "Your total is #{player_hand.sum_value}, you bust!"
        #   else
        #     puts "Your hand is now #{player_hand.card_display}, would you like to hit or stand?"
        #     decision = gets.chomp.downcase
        #     if decision == "hit"
        #       player_hand.cards << deck.deal
        #       if player_hand.sum_value > 21
        #         puts "Your total is #{player_hand.sum_value}, you bust!"
        #       else
        #         puts "Your hand is now #{player_hand.card_display}, would you like to hit or stand?"
        #         decision = gets.chomp.downcase
        #         if decision == "hit"
        #           player_hand.cards << deck.deal
        #           if player_hand.sum_value > 21
        #             puts "Your total is #{player_hand.sum_value}, you bust!"
        #           else
        #             puts "Your hand is now #{player_hand.card_display}, would you like to hit or stand?"
        #           end
        #         end
        #       end
            # end


  # elsif decision == "stand"
  #   # stand
  #   if player_hand.sum_value > house_hand.sum_value && house_hand.sum_value > 16
  #     puts "You have #{player_hand.card_display} and the house has #{house_view}, you win!"
  #   elsif player_hand.sum_value > house_hand.sum_value && house_hand.sum_value < 16
  #     puts "You have #{player_hand.card_display} and the house has #{house_view}, house will hit"
  #     house_hand.cards << deck.deal
  #     if player_hand.sum_value < house_hand.sum_value && house_hand.sum_value <= 21
  #       puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, house wins!"
  #     elsif house_hand.sum_value > 21
  #       puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, house busts, you win!"
  #     elsif 16 <= house_hand.sum_value && house_hand.sum_value <= 21 && player_hand.sum_value > house_hand.sum_value
  #       puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, you win!"
  #     else
  #       puts "You have #{player_hand.card_display} and the house has #{house_view}, house will hit again"
  #       house_hand.cards << deck.deal
  #       if player_hand.sum_value < house_hand.sum_value && house_hand.sum_value <= 21
  #         puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, house wins!"
  #       elsif house_hand.sum_value > 21
  #         puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, house busts, you win!"
  #       elsif 16 <= house_hand.sum_value && house_hand.sum_value <= 21 && player_hand.sum_value > house_hand.sum_value
  #         puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, you win!"
  #       else
  #         puts "You have #{player_hand.card_display} and the house has #{house_view}, house will hit again"
  #         house_hand.cards << deck.deal
  #         if player_hand.sum_value < house_hand.sum_value && house_hand.sum_value <= 21
  #           puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, house wins!"
  #         elsif house_hand.sum_value > 21
  #           puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, house busts, you win!"
  #         elsif 16 <= house_hand.sum_value && house_hand.sum_value <= 21 && player_hand.sum_value > house_hand.sum_value
  #           puts "You have #{player_hand.card_display}, totaling #{player_hand.sum_value} and the house has #{house_view}, totaling #{house_hand.sum_value}, you win!"
  #         end
  #       end
  #     end
  #   end
