############ MAIN PROBLEM: I CAN'T ASSOCIATE VALUES WITH CARDS #############

# classes -- cards, deck, hand, players, dealer, game

# Card class
# Data: has suit and value
# Behavior: none
class Card #####!!!!!@!@$@!$! WHY DOES THIS CLASS NOT DO ANYTHING?!?!
  attr_reader :suit, :value
  def initialize(suit, value)   #card knows its rank
    @suit = suit
    @value = value
  end

  # def display_face #WHY DOES THIS NOT WORK?@#!@!@%!
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

# Deck class
# Data: Cards
# Behavior: Shuffle, Draw
class Deck
  def initialize
    @cards = []
    [:Hearts, :Diamonds, :Spades, :Clubs].each do |suit|
      (2..14).each do |value| # Deck has 52 Cards
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
end



# Hand class
# Data: Deck subset
# Behavior: Holds cards, Starts with 2 cards, draws more cards, plays cards
class Hand
  # def initialize(face_down, face_up)  # hand starts with 2 cards
  def run
    @deck = Deck.new
    @deck.shuffle
  end

  def player_draw
    @hand = [:face_down, :face_up].map do # Hand holds 2 Cards from the Deck
      @deck.draw
    end
  end

  def dealer_draw
    @hand = [:face_down, :face_up].map do # Hand holds 2 Cards from the Deck
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

class Game   # game sets up the dealer, deck, and player
  def run
    hand = Hand.new
    hand.run
    hit_me = hand.hit_me
    system("clear")
    puts "Let's play some Blackjack!"
    puts "__________________________"
    puts

    player_hand = hand.player_draw
    dealer_hand = hand.dealer_draw

    puts "Player is dealt:\n     #{player_hand.join("\n     ")}."
    puts
    puts "Dealer is dealt:\n     #{dealer_hand.join("\n     ")}."
    puts

    # game controls input and output
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
        puts "Player's cards:\n     #{player_hand.join("\n     ")}\n     #{last_elem}."
        player_hand << last_elem
        puts
        puts "Dealer's cards:\n     #{dealer_hand.join("\n     ")}."
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

    puts

    # game determines if game is over
    if player_hand > dealer_hand
      puts "Player wins"
    elsif player_hand < dealer_hand
      puts "Computer wins"
    else
      puts "TIE"
    end

  end
end

Game.new.run
