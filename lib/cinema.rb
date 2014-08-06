class Cinema

  def initialize(rows,seats)
    @rows  = rows
    @seats = seats
    # @cinema = Array.new(@rows) { Array.new(@seats) }
    # @cinema
  end

  def create_cinema
    cinema = Array.new(@rows) { Array.new(@seats) }
    cinema
  end

  def seats
    @seats
  end

  def cinema
    @cinema
  end

end

    # cinema = Array.new(@rows) { Array.new(@seats) }
    # cinema[0][0]=1
