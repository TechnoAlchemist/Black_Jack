class Deck
  SUITS = ['♠', '♣', '♥', '♦']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  
  def pop
    @deck.pop
  end

  def build
    @deck = []
    SUITS.each do |suit|
    VALUES.each do |value|
        @deck.push(Card.new(suit, value))
      end
    end
  end

  def shuffle
    @deck.shuffle!
  end

  def build_and_shuffle
    build
    shuffle
  end
end

class Card
  attr_reader :suit, :value
   def initialize(suit, value)
    @suit = suit
    @value = value
  end
end

class Hand
  def initialize(gamer)
    @cards = []
    @gamer = gamer 
  end

  def display_hand
    @cards.each do |card|
      puts "#{@gamer} was dealt: #{card.value} #{card.suit}"  
    end
  end
  
  def hit(card)
    @cards << card
  end

  def stay
    hand_stay = 17
    if @cards.value <= hand_stay
    end
  end

  def score
  end

  def busted?
  end
end

class Game
  def initialize
    @deck = Deck.new
  end

  def deal_hand
    @deck.build_and_shuffle
    @player_hand = Hand.new("player")
    2.times {@player_hand.hit(@deck.pop)}
    @dealer_hand = Hand.new("dealer")
    2.times {@dealer_hand.hit(@deck.pop)}
    @player_hand.display_hand
    @dealer_hand.display_hand
  end

  ###I want to create method that asks the player whether they want to hit or stand
  def hit_or_stay
    winning_hand = 21
    puts "Player score: #{@player_hand.score}?"
    input = ""
    until input == 's' || @player_hand.score > winning_hand 
      print "Hit or Stand (h/s)?"
      input = gets.chomp
      if input == 'h'
      @player_hand.hit(@deck.pop)
      end
    end
  end
end


game = Game.new
game.deal_hand
