class Cinema

  def initialize(rows,seats)
    @cinema = Array.new(rows) { Array.new(seats,Seat.new) }
    self
  end

  # def create_cinema
  #   cinema=[]
  #   rows.times { cinema << Array.new(seats,Seat.new)}
  #   cinema
  # end


  def cinema
    @cinema
  end

  def display
    # Method to display all of the seats in a cinema on the screen
    @cinema.each { |row| print row,"\n" }
  end

end
