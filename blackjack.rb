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
  def run
    @cards = []
    [:Hearts, :Diamonds, :Spades, :Clubs].each do |suit|
      (2..14).each do |value|
        @cards.push(Card.new(suit, value))
      end
    end
  end

  # def count  #deck can be counted????
  #   @cards.count
  # end

  def shuffle  #deck can be shuffled
    @cards.shuffle!
  end

  def draw   #deck can draw cards
    @cards.shift
  end
end

# Deck has 52 Cards
# Hand holds 2 Cards from the Deck

# Data: Deck subset
# Behavior: Holds cards, Starts with 2 cards, draws more cards, plays cards
class Hand
  def run
    @deck = Deck.new
    @deck.run
    @deck.shuffle
  end

  def player_draw
    @hand = [:face_down, :face_up].map do
      @deck.draw
    end
  end

  def dealer_draw
    @hand = [:face_down, :face_up].map do
      @deck.draw
    end
  end

  def hit_me
    @hand = @deck.draw

  end

  #
  # def calc_total   # calculate total value in hand
  #   puts @cards.count
  #
  # end

  # def bust
  #   if calc_total > 21
  #     puts "BUST!"
  #     exit
  #   end
  # end



  # a hand knows if its busted
end


# class Player     ### broken
#   def hit
#     @hit = [hand.player_draw, :face_up].map do
#       @deck.draw
#     end
#   end


#   # a player has money
#   # player can gain or lose money
#   # player has a hand
#   # player can draw
#   # def hit_me #INCOMPLETE
#   #   @hand.map do
#   #     @deck.draw
#   #
#
# end

class Dealer
  # dealer has a deck
  # dealer can give player cards
end

class Game
  def run
    # deck = Deck.new
    # hand = Hand.new(deck.draw, deck.draw)
    hand = Hand.new
    hand.run
    hit_me = hand.hit_me
    system("clear")
    puts "Let's play some Blackjack!"
    puts "__________________________"
    puts

    player_hand = hand.player_draw
    dealer_hand = hand.dealer_draw


    puts "Player is dealt:  #{player_hand.join(" and ")}."
    puts
    puts "Dealer is dealt:  #{dealer_hand.join(" and ")}."
    puts

    loop do
      print "Would you like to draw another card? "
      response = gets.chomp.downcase
      case response
      when "hit me", "hit", "yes", "y"
        system("clear")
        puts "Player is dealt another card"
        puts "____________________________"
        puts
        player_hand << hand.hit_me
        last_elem = player_hand.pop
        puts "Player's  cards:  #{player_hand.join(", ")}, and #{last_elem}."
        player_hand << last_elem
        puts
        puts "Dealer's  cards:  #{dealer_hand.join(" and ")}."
        puts
      when "stay", "no", "n"
        puts
        break
      else
        puts
        puts "Sorry, I didn't catch that..."
        puts
      end
    end

    # last_elem = over_eighteen.pop
    #       puts "You can #{over_eighteen.join} and #{last_elem}."

    puts

    if player_hand > dealer_hand
      puts "Player wins"
    elsif player_hand < dealer_hand
      puts "Computer wins"
    else
      puts "TIE"
    end

  # game sets up the dealer, deck, and player
  # game controls input and output
  # game determines if game is over
  end
end

Game.new.run
