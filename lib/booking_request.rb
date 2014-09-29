class BookingRequest

  attr_reader :booking_info

  def initialize(hash)
    @booking_info = hash
  end

  def all_fields?
    booking_info.length == 5
  end

  def valid_id?
    booking_info[:id] >= 0
  end
  
  def single_row?
    booking_info[:startrow] == booking_info[:endrow]
  end

  def valid_rows?(theatre)
    booking_info[:startrow] <= theatre.theatre.count
  end

  def seats_in_order?
    booking_info[:firstseat] <= booking_info[:lastseat]
  end

  def sizechecker(theatre)
    theatre.max_booking >= (booking_info[:lastseat] - booking_info[:firstseat])
  end

  def within_row?(theatre)
    booking_info[:lastseat] <= (theatre.theatre[0].seats.count - 1)
  end

end