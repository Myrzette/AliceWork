require 'time'

class Event

  attr_accessor :start_date, :duration, :title ,:attendees

  def initialize(start_date_to_save, duration_to_save, title_to_save, attendees_to_save)

    @start_date = Time.parse(start_date_to_save).strftime('%H:%M:%S %d/%m/%Y')
    @duration = duration_to_save 
    @title = title_to_save
    @attendees = attendees_to_save
  
  end

  def postpone_24h
    @start_date = (Time.parse(@start_date) + 24*60*60).strftime('%H:%M:%S %d/%m/%Y')
  end

  def end_date
    (Time.parse(@start_date) + @duration*60).strftime('%H:%M:%S %d/%m/%Y')
  end

  def is_past?
    Time.parse(@start_date)<Time.now  
  end

  def is_future?
    !is_past?
  end

  def is_soon?
  Time.parse(@start_date) - Time.now <= 30*60  
  end

	def to_s
		">Titre : #{@title}\n>Date de début :  #{@start_date}\n>Durée : #{@duration}\n>Invités : #{@attendees.join(", ")}\n" 	
  end

end
