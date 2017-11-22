require "nichy/rps/version"

module Nichy
  module Rps
    class RPS

      def initialize
        puts "Welcome to the Rock, Paper, Scissors game! What's your name? "
        @name = STDIN.gets.chomp
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
        if user_choice == "r"
          case computer_choice
          when "Rock"
            @game_history[:draws] += 1
          when "Paper"
            @game_history[:computer] += 1
            winner = "Computer"
          else
            @game_history[:player] += 1
            winner = "Player"
          end
        elsif user_choice == "p"
          case computer_choice
          when "Rock"
            @game_history[:computer] += 1
            winner = "Computer"
          when "Paper"
            @game_history[:draws] += 1
          else
            @game_history[:player] += 1
            winner = "Player"
          end
        else
          case computer_choice
          when "Rock"
            @game_history[:computer] += 1
            winner = "Computer"
          when "Paper"
            @game_history[:player] += 1
            winner = "Player"
          else
            @game_history[:draws] += 1
          end
        end
        winner
      end

      private
        def computer_play
          choice = rand(1..3)
          if choice == 1
            computer_choice = "Rock"
          elsif choice == 2
            computer_choice = "Paper"
          else
            computer_choice = "Scissors"
          end
          computer_choice
        end
    end
  end
end
