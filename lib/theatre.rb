class Cinema

  def initialize(rows,seats)
    @cinema = Array.new(rows) { Array.new(seats,Seat.new) }
    self
  end

  def cinema
    @cinema
  end

  def display
    # Method to display all of the seats in a cinema on the screen
    @cinema.each { |row| print row,"\n" }
  end

end
