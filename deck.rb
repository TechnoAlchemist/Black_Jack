#require 'card'

class Deck

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
end



new_deck = Deck.new
new_deck.initial_deal
new_deck.display(:player)
new_deck.display(:dealer)
