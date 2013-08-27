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

  def score
    score = 0 
    @cards.each do |card|
      value = card.value

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

  def busted?
    score > 21
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
    puts "Player score: #{@player_hand.score}?"
    input = ""
    until input == 's' || @player_hand.busted?
      # break if @player_hand.busted?
      print "Hit or Stand (h/s)?"
      input = gets.chomp
      if input == 'h'
        @player_hand.hit(@deck.pop)
        puts @player_hand.score
      end
    end
  end

   def dealers_turn
    dealer_stops = 17
    until @dealer_hand.score >= dealer_stops
        @dealer_hand.hit(@deck.pop)
    end 
  end

  def who_won
    if @player_hand.busted?
      puts "Bust! You lose...homey"
    elsif @dealer_hand.score > 21
        puts "Dealer busts." 
        puts "You win!"
    elsif @dealer_hand.score < @player_hand.score 
      puts "Dealer score: #{@dealer_hand.score}"
      puts "Dealer stands"
      puts "You win!"  
    elsif @dealer_hand.score > @player_hand.score 
      puts "Dealer score: #{@dealer_hand.score}"
      puts "Dealer wins!"
    end
  end

end


game = Game.new
game.deal_hand
game.hit_or_stay
game.dealers_turn
game.who_won
