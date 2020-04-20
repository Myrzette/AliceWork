require 'pry'
require_relative 'lib/user.rb'
require_relative 'lib/event.rb'

def perform
  alice = User.new("alice@gmail.com","25")
  elsa = User.new("elsa@gmail.com","45")
  julie = User.new("julie@gmail.com","30")
  pierre = User.new("pierre@gmail.com","35")

#   #binding.pry
#   #puts "end of file"

#   puts User.count

pot_de_depart = Event.new("2020-05-02 19:00",120,'pot de départ',['test@email.com', 'test2@email.com'] )
test = Event.new("2020-04-20 19:00",  120, 'test', ['test', 'test2'])

# pot_de_depart.postpone_24h
# puts pot_de_depart.start_date
# puts pot_de_depart.is_soon?
# puts test.is_soon?

# puts pot_de_depart.to_s

  user = User.find_by_email("elsa@gmail.com")
  # puts user.to_s
  puts user.age

end


perform
