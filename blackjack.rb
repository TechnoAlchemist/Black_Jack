#!/usr/bin/env ruby
# encoding: UTF-8

class Game
  SUITS = ['♠', '♣', '♥', '♦']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']


  def initialize
    @deck = []
  
    @p_hand = []
    @d_hand = []
    build_deck
  end

  def build_deck
    SUITS.each do |suit|
      VALUES.each do |value|
        @deck.push(value + suit)
      end
    end

    @deck.shuffle!
  end

  def initial_deal
    2.times do 
      @p_hand << @deck.pop 
      @d_hand << @deck.pop 
    end
    # calculate_score(hand)
  end


  #I want to be able to list my hand
  def display(gamer)
    if gamer == :player
    @p_hand.each do |card|
      puts "#{gamer} was dealt #{card}"
      #puts car 
      end
    elsif gamer == :dealer
      @d_hand.each do |card|
        puts "#{gamer} was dealt #{card}"
      end
    end
  end

  # puts deck
  #The player can look at his or her current score
  #Want to use a calculate method that returns the score
  #Calculate the score by adding the values together
  # I need to be able to get the values of the cards
  # hand1 = hand[0].chop
  # puts hand1
  # def convert_cards(card_value)
  #   score = 0
  #   case card_value
  #   when 'J'  
  #     score = 10
  #   when 'Q'
  #     score = 10
  #   when 'K'
  #     score = 10
  #   when 'A'
  #     score = 11
  #   else
  #    score = card_value
  #   end
  #   @total_value += score.to_i
  # end

  def calculate_score(gamer)
    score = 0
    hand = @p_hand if gamer == :player
    hand = @d_hand if gamer == :dealer

    # @hand = ["2H", "10C", "AS"]
    hand.each do |card|
      value = card.chop

      if value == 'J' || value == 'Q' || value == 'K'
        score += 10
      elsif value == 'A'
        score += 1
      else
        score += value.to_i
      end
    end

    score
      # card_value = @hand[suit].chop
      # convert_cards(card_value)
  end

  #The player can decide if he/she wants to to hit or stand
  def players_turn
    puts "Player score: #{calculate_score(:player)}"
    input = ""
    winning_hand = 21
    
    until input == 's' || calculate_score(:player) > winning_hand
      print "Hit or stand (H/S):"
      input = gets.chomp
      if input == 'h'
      #need to keep going until player is close 21 but not going over
        hit(:player)
        puts calculate_score(:player)
        if calculate_score(:player) > winning_hand
          puts "Bust! You lose..."
        end
      end
    end 
  end

  def dealers_turn
    player_hand = 21
    dealer_stops = 21
    until calculate_score(:dealer) <= dealer_stops
      #need to keep going until player is close 21 but not going over
        hit(:dealer)
        # puts "Dealer stands"
    end
      if calculate_score(:dealer) > dealer_stops
        puts "Dealer busts." 
        puts "You win!"
        # puts "Dealer stands."
      elsif calculate_score(:dealer) < calculate_score(:player) && calculate_score(:player ) <= player_hand
        puts "Dealer stands"
        puts "You win"
      end
  end

  def hit(gamer)
    hand = @p_hand if gamer == :player
    hand = @d_hand if gamer == :dealer
    hand << @deck.pop
    puts "Dealt card #{hand.last}"
    
    # @total_value = calculate_score
    # puts @total_value
    # puts calculate_score(hand)
  end

end

# calculate_score(hand)

#The player's score is printed for all to see
#The dealer's first card is dealt
#The dealer's 2nd card is dealt
#The dealer score is revealed
#The dealer will hit or stand depending on score
#If the player's hand is higher than the dealer, then he wins 

#Want to prompt user that he or she is playing Blackjack
puts "Welcome to Blackjack!"
blackjack = Game.new
blackjack.initial_deal
blackjack.display(:player)
blackjack.display(:dealer)
# puts blackjack.total_value
blackjack.players_turn
blackjack.dealers_turn

