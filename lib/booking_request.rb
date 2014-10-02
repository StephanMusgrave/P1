class BookingRequest

  attr_reader :booking_info

  def initialize(hash)
    @booking_info = hash
  end

  def all_fields_present?
    booking_info.length == 5
  end

  def valid_id?
    booking_info[:id] >= 0
  end
  
  def single_row?
    booking_info[:startrow] == booking_info[:endrow]
  end

  def valid_rows?(rows)
    booking_info[:startrow] <= rows
  end

  def seats_in_order?
    booking_info[:firstseat] <= booking_info[:lastseat]
  end

  def size_checker(max_booking)
    max_booking >= (booking_info[:lastseat] - booking_info[:firstseat])
  end

  def within_row?(seats)
    booking_info[:lastseat] <= (seats - 1)
  end

  def valid?(seats, max_booking, rows)
    all_fields_present? && valid_id? && single_row? && 
    valid_rows?(rows) && seats_in_order? && 
    size_checker(max_booking) && within_row?(seats)
  end

end