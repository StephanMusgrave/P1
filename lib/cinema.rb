class Cinema

  def initialize(rows,seats)
    @rows  = rows
    @seats = seats
    @auditorium = Array.new(rows) { Array.new(seats) }
  end

  def auditorium
    @auditorium
  end

end
