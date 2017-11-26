class GameCompare

  GAME_COMPARE_MATRIX = {
      r: { r: :draw,  s: :player,  p: :computer },
      s: { r: :computer,  s: :draw,  p: :player },
      p: { r: :player,  s: :computer,  p: :draw }
  }

  def self.compare(player_choice, computer_choice)
    GAME_COMPARE_MATRIX[player_choice.to_sym][computer_choice.to_sym]
  end
end
