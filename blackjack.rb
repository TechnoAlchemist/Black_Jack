#!/usr/bin/env ruby
# encoding: UTF-8

class Game
  SUITS = ['♠', '♣', '♥', '♦']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  attr_reader :total_value

  def initialize
    @deck = []
    @total_value = 0
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

  def calculate_score(hand)
    score = 0
    
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
    input = ""
    winning_hand = 21
    until input == 's'
    print "Hit or stand (H/S):"
    input = gets.chomp
      if input == 'h'
      #need to keep going until player is close 21 but not going over
        hit
        puts calculate_score(@p_hand)
        if calculate_score(@p_hand) > winning_hand
          puts "Bust! You lose..."
          break
        end
      elsif input == 's'
        puts calculate_score(@p_hand)
      end
    end 
  end

  def dealers_turn
    dealer_stops = 17
    until calculate_score(@d_hand) <= dealer_stops
      #need to keep going until player is close 21 but not going over
        hit
    end
    if calculate_score(@d_hand) > dealer_stops
      puts "Dealer busts." 
      puts calculate_score(@d_hand)
    else
    puts "Dealer stands."
    end
  end

  def hit(hand)
    card = @deck.pop
    puts "Dealt card #{card}"
    hand << card
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
puts blackjack.total_value
blackjack.players_turn
blackjack.dealers_turn

