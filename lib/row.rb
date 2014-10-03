class Row

  attr_reader :seats

  def initialize(length = 50)
    @seats = Array.new(length, Seat.new)
  end

  def size
    @seats.length
  end

end
