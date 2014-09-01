class Theatre

  def initialize(rows,seats)
    @theatre = Array.new(rows) { Array.new(seats,Seat.new) }
    self
  end

  def theatre
    @theatre
  end

  def display
    # Method to display all of the seats in a theatre on the screen
    @theatre.each { |row| print row,"\n" }
  end

end
