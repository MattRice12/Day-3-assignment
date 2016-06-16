# classes -- cards, deck, hand, players, dealer, game


# Data: has suit and value
# Behavior: none
class Card
  attr_reader :suit, :value
  def initialize(suit, value)   #card knows its rank
    @suit = suit
    @value = value
  end

  # def display_rank #WHY DOES THIS NOT WORK?@#!@!@%!
  #   case @value
  #     when "11"
  #       "Jack"
  #     when "12"
  #       "Queen"
  #     when "13"
  #       "King"
  #     when "14"
  #       "Ace"
  #     else
  #       @value
  #     end
  #   end

  def to_s
    "The #{@value} of #{@suit}"
  end
end

# Data: Cards
# Behavior: Shuffle, Draw
class Deck
  attr_reader :cards
  def initialize
    @cards = []
    [:Hearts, :Diamonds, :Spades, :Clubs].each do |suit|
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
  attr_reader :face_down, :face_up
  def initialize(face_down, face_up)  # hand starts with 2 cards
    @face_down = face_down
    @face_up = face_up
    @deck = Deck.new
    @deck.shuffle
  end

  def player_draw
    @hand = [:face_down, :face_up].map do
      @hand = @deck.draw
    end

  end

  def dealer_draw
    @hand = [:face_down, :face_up].map do
      @hand = @deck.draw
      # puts @dealer_hand = deck.draw
    end
  end


  def calc_total   # calculate total value in hand
    puts @cards.count

  end

  # def bust
  #   if calc_total > 21
  #     puts "BUST!"
  #     exit
  #   end
  # end



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
    # response = gets.chomp.downcase
    # if response == "yes"
      @hand << deck(suit, value)
    end
  end
end

class Dealer
  # dealer has a deck
  # dealer can give player cards
end

class Game
  def run
    deck = Deck.new
    hand = Hand.new(deck.draw, deck.draw)
    puts "Let's play some Blackjack!"

    player_hand = hand.player_draw
    dealer_hand = hand.dealer_draw

    puts "Player's cards are #{player_hand}"
    puts "Dealer's cards are #{dealer_hand}"

  # game sets up the dealer, deck, and player
  # game controls input and output
  # game determines if game is over
  end
end

Game.new.run
