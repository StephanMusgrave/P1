require_relative "row"


class Theatre

  def initialize(rows = 100, seats = 50)
    @theatre = Array.new(rows, Row.new(seats))
    self
  end

  def seat(row, seat)
    @theatre[row].seats[seat]
  end

  def seats_per_row
    @theatre[0].size
  end

def rows_per_theatre
    @theatre.count
  end


  def display
    # Method to display all of the seats in a theatre on the screen
    @theatre.each { |row| print row,"\n" }
  end

end
