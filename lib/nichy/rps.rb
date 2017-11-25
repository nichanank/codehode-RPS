require "nichy/rps/version"

module Nichy
  module Rps
    class RPS

      def initialize
        puts "Welcome to the Rock, Paper, Scissors game! What's your name? "
        @name = STDIN.gets.chomp
        puts "Hi #{@name}! Let's play..."
        @game_history = { :computer => 0, :player => 0, :draws => 0, :total_played => 0 }
        @valid_options = ["r", "rock", "p", "paper", "s", "scissors"]
      end

      def play
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
          winner = compare(user_choice, computer_choice)
          if winner != ""
            puts "#{winner} wins!"
          else
            puts "It's a tie!"
          end
          @game_history[:total_played] += 1
        end
        puts @game_history
        puts "Your win rate was #{@game_history[:player] / @game_history[:total_played].to_f * 100}%"
      end

      def compare(user_choice, computer_choice)
        winner = ""
        if user_choice == "r" || user_choice == "rock"
          case computer_choice
          when "r"
            @game_history[:draws] += 1
          when "p"
            @game_history[:computer] += 1
            winner = "Computer"
          else
            @game_history[:player] += 1
            winner = "Player"
          end
        elsif user_choice == "p" || user_choice == "paper"
          case computer_choice
          when "r"
            @game_history[:computer] += 1
            winner = "Computer"
          when "p"
            @game_history[:draws] += 1
          else
            @game_history[:player] += 1
            winner = "Player"
          end
        else
          case computer_choice
          when "r"
            @game_history[:computer] += 1
            winner = "Computer"
          when "p"
            @game_history[:player] += 1
            winner = "Player"
          else
            @game_history[:draws] += 1
          end
        end
        winner
      end

      def play_again?
        puts "Would you like to play again? [y/n]"
        answer = gets.chomp.downcase
        if answer != "y" && answer != "n"
          puts "Please type y or n and press Enter"
        end
        answer == "y" ? true : false
      end

      private
        def computer_play
          choice = rand(1..3)
          if choice == 1
            computer_choice = "r"
          elsif choice == 2
            computer_choice = "p"
          else
            computer_choice = "s"
          end
          computer_choice
        end

    end
  end
end
