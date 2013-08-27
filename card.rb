class Card
  
  attr_reader :suits, :values
  
  def initialize(values = nil, suits = nil)
    if suits.nil? && values.nil?
      @suits = ['♠', '♣', '♥', '♦'].sample
      @values =['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].sample
    else
      @suits = suits
      @values = values
    end
    puts "Create a new card: #{@values} of #{@suits}"
  end

  def draw_cards

  end
end

#I want to create a card class
class Card
  def initialize(suits, values)
    @suits = 
end
#The class should just initialize a a suit and a value
