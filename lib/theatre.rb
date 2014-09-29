require_relative "row"


class Theatre

  MAXBOOKING = 5

  attr_reader :theatre

  def initialize(rows = 100,seats)
    @theatre = Array.new(rows, Row.new)
    self
  end

  def seat(row, seat)
    theatre[row].seats[seat]
  end


  def display
    # Method to display all of the seats in a theatre on the screen
    @theatre.each { |row| print row,"\n" }
  end

  def max_booking
    MAXBOOKING
  end

end
