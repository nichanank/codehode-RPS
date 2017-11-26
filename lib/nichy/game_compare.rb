class GameCompare
  def self.compare(user_choice, computer_choice)
    result = ""
    if user_choice == "r" || user_choice == "rock"
      case computer_choice
        when "r"
          result = :draw
        when "p"
          result = :computer
        else
          result = :player
      end
    elsif user_choice == "p" || user_choice == "paper"
      case computer_choice
        when "r"
          result = :player
        when "p"
          result = :draw
        else
          result = :computer
      end
    else
      case computer_choice
        when "r"
          result = :computer
        when "p"
          result = :player
        else
          result = :draw
      end
    end

    result
  end


end