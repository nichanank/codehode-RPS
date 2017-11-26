require "nichy/rps/version"
require "nichy/game_compare"
module Nichy
  module Rps
    class RPS

      def initialize
        @game_history = { :computer => 0, :player => 0, :draw => 0, :total_played => 0 }
        @valid_options = ["r", "rock", "p", "paper", "s", "scissors"]
      end

      def play
        puts "Welcome to the Rock, Paper, Scissors game! What's your name? "
        @name = STDIN.gets.chomp
        puts "Hi #{@name}! Let's play..."

        while @game_history[:total_played] < 5
          computer_choice = computer_play
          puts "Enter r, p, or s: "
          user_choice = STDIN.gets.chomp.downcase
          while !@valid_options.include?(user_choice)
             puts "Invalid choice, please enter r, p, or s"
             puts "What's your choice?"
             user_choice = STDIN.gets.chomp.downcase
          end
          puts "Computer plays #{computer_choice}"
          puts "..."
          game_result = GameCompare.compare(normalize_choice(user_choice), computer_choice)
          @game_history[game_result] += 1

          if game_result != :draw
            puts "#{game_result} wins!"
          else
            puts "It's a tie!"
          end
          @game_history[:total_played] += 1
        end

        puts @game_history
        puts "Your win rate was #{@game_history[:player] / @game_history[:total_played].to_f * 100}%"
        play_again? ? play : return
      end

      def play_again?
        puts "Would you like to play again? [y/n]"
        answer = STDIN.gets.chomp.downcase
        while answer != "y" && answer != "n"
          puts "Please type y or n and press Enter"
          answer = STDIN.gets.chomp.downcase
        end
        if answer == "y"
          @game_history.each { |k, v| @game_history[k] = 0 }
          true
        else
          false
        end
      end

      private
      def computer_play
        [:r, :p, :s].sample
      end

      def normalize_choice(choice)
        return :r if choice == 'r' || choice == 'rock'
        return :p if choice == 'p' || choice == 'paper'
        return :s if choice == 's' || choice == 'scissors'
      end
    end
  end
end
