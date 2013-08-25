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
  end

  #I want to be able to list my hand
  def display(gamer)
    if gamer == :player
    @p_hand.each do |card|
      puts "#{gamer} was dealt #{card}"
      end
    elsif gamer == :dealer
      @d_hand.each do |card|
        puts "#{gamer} was dealt #{card}"
      end
    end
  end


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
  end

  #The player can decide if he/she wants to to hit or stand
  def players_turn
    puts "Player score: #{calculate_score(:player)}"
    input = ""
    winning_hand = 21
    
    #need to keep going until player is close 21 but not going over
    until input == 's' || calculate_score(:player) > winning_hand
      print "Hit or stand (H/S):"
      input = gets.chomp
      if input == 'h'  
        hit(:player)
        puts calculate_score(:player)
      end
    end 
    if calculate_score(:player) > winning_hand
      puts "Bust! You lose..."
    end
  end

  def dealers_turn
    dealer_stops = 17
    until calculate_score(:dealer) >= dealer_stops
        hit(:dealer)
    end
      
  end

  def who_won
    great_hand = 21
    if calculate_score(:dealer) > great_hand
        puts "Dealer busts." 
        puts "You win!"
    elsif calculate_score(:dealer) < calculate_score(:player) && calculate_score(:player ) <= great_hand
      puts "Dealer score: #{calculate_score(:dealer)}"
      puts "Dealer stands"
      puts "You win!"  
    elsif calculate_score(:dealer) > calculate_score(:player) && calculate_score(:dealer) <= great_hand
      puts "Dealer score: #{calculate_score(:dealer)}"
      puts "Dealer wins!"
    end
  end

  def hit(gamer)
    hand = @p_hand if gamer == :player
    hand = @d_hand if gamer == :dealer
    hand << @deck.pop
    puts "Dealt card #{hand.last}"
  end

end

#Want to prompt user that he or she is playing Blackjack
puts "Welcome to Blackjack!"
blackjack = Game.new
blackjack.initial_deal
blackjack.display(:player)
blackjack.display(:dealer)
blackjack.players_turn
blackjack.dealers_turn
blackjack.who_won
