# classes -- cards, deck, hand, players, dealer, game


# Data: has suit and value
# Behavior: none
class Card
  attr_reader :suit, :value
  def initialize(suit, value)   #card knows its rank
    @suit = suit
    @value = value
  end

  def to_s  #card can display itself as a string
    "The #{@value} of #{@suit}"
  end
end

# Data: Cards
# Behavior: Shuffle, Draw
class Deck
  def initialize
    @cards = []
    [:hearts, :diamonds, :spades, :clubs].each do |suit|
      (2..14).each do |value|
        @cards.push(Card.new(suit, value))
      end
    end
  end

  def count  #deck can be counted????
    @cards.count
  end

  def shuffle  #deck can be shuffled
    @cards.shuffle!
  end

  def draw   #deck can draw cards
    @cards.shift
  end


  ##########deck can know what's in the deck
  ##########deck can know what's not in the deck


end

# Deck has 52 Cards
# Hand holds 2 Cards from the Deck


# Data: Deck subset
# Behavior: Holds cards, Starts with 2 cards, draws more cards, plays cards
class Hand
  def start_hand   # hand starts with 2 cards
    @hand = []
    deck = Deck.new
    deck.shuffle
    [:face_down, :face_up].map do
      @hand << deck.draw
    end
  end

  # def calc_total   # calculate total value in hand
  #   @hand.value.each do |calc|
  #     calc =
  #   end
  # end

  def bust
    if calc_total > 21
      puts "BUST!"
      exit
    end
  end



  # a hand knows if its busted
end


class Player
  # a player has money
  # player can gain or lose money
  # player has a hand
  # player can draw
  def hit_me #INCOMPLETE
    @hand.map do |draw|

    # puts "Would you like to draw a card?"
    # response = gets.chomp
    # if response.downcase == "yes"
      @hand << deck(suit, value)
    end
  end
end

class Dealer
  # dealer has a deck
  # dealer can give player cards
end

class Game
  # game sets up the dealer, deck, and player
  # game controls input and output
  # game determines if game is over
end
