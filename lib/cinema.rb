class Cinema

  def initialize(rows,seats)
    @rows  = rows
    @seats = seats
    @auditorium = Array.new(@rows) { Array.new(@seats) }
    @auditorium
  end

  # def create_cinema
  #   auditorium = Array.new(@rows) { Array.new(@seats) }
  #   auditorium
  # end

  def seats
    @seats
  end

  def rows
    @rows
  end

  def auditorium
    @auditorium
  end

end

    # auditorium = Array.new(@rows) { Array.new(@seats) }
    # auditorium[0][0]=1
