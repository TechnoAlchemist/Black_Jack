class Card
  
  #attr_reader :suits, :values
  
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
end

new_card = Card.new()

2.times {new_card}


