require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/game.rb'
require_relative 'lib/player'

# binding.pry

def perform
  # player1 = Player.new("Josiane")
  # player2 = Player.new("José")
  

  # while player2.life_points > 0
  #   puts " "
  #   puts "Voici l'état de chaque joueur"
  #   puts "#{player1.show_state} et #{player2.show_state} "
  #   puts " "
  #   puts "Passons à la phase d'attaque !!!"
  #   player2.attacks(player1)
  #   break if player1.life_points <= 0 
  #   player1.attacks(player2)
  humanplayer1 = HumanPlayer.new("Louise")  
  humanplayer1.show_state
  humanplayer1.search_weapon
  # end
  humanplayer1.search_health_pack
end

perform
