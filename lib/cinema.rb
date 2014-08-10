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

def display_cinema(cinema)
  row = 0
  while row < cinema.auditorium.length
    print row,"\t",cinema.auditorium[row] ; puts
    row += 1
  end
end
