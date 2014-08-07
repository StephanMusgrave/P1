class Cinema

  def initialize(rows,seats)
    @rows  = rows
    @seats = seats
    @auditorium = Array.new(rows) { Array.new(seats,0) }
  end

  def auditorium
    @auditorium
  end

end
