require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/game.rb'
require_relative 'lib/player.rb'

def perform
  puts "------------------------------------------------\n|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |\n|Le but du jeu est d'être le dernier survivant !|\n-------------------------------------------------"
  puts "Comment t'appelles-tu ?"
  print ">"
  player = gets.chomp
  player = HumanPlayer.new(player)

  enemies = []
  enemy1 = Player.new("Josiane")
  enemy2 = Player.new("José")
  enemies << enemy1 << enemy2

  while player.life_points > 0 && (enemy1.life_points > 0 || enemy2.life_points > 0)

    puts " "
    puts "Voici l'état de chaque joueur"
    puts "#{enemy1.show_state} , #{enemy2.show_state} et #{player.show_state} "
    puts " "
    puts "Passons à la phase d'attaque !!!"
    puts "Quelle action veux-tu effectuer ?\n 
    a - chercher une meilleure arme\n
    s - chercher à se soigner\n\n
    attaquer un joueur en vue :\n
    0 - #{enemy1.show_state} \n
    1 - #{enemy2.show_state} "
    
    print '>'
    answer = gets.chomp

    if answer == 'a'
      player.search_weapon 
    elsif answer == 's'
      player.search_health_pack
    elsif answer == '0'
      player.attacks(enemy1)
    elsif answer == '1'
      player.attacks(enemy2)
    end
    
    puts " "
    puts "Les autres joueurs attaquent !!!"

    enemies.each do |enemy|
      enemy.attacks(player)
    end
    puts " "
    
    #   break if player1.life_points <= 0 
    #   player1.attacks(player2)
  end

  puts "La partie est terminée"
  if player.life_points > 0
    puts "Bravo, tu as gagné"
  else 
    puts "Bye, loser !"
  end

end

perform 