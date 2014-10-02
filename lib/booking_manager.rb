class BookingManager

  MAXBOOKING = 5

  attr_reader :theatre, :rows, :seats
  
  def initialize(theatre)
    @theatre = theatre
    @rows = theatre.rows_per_theatre
    @seats = theatre.seats_per_row
  end

  def file_open(filename)
    @file = File.open(filename)
  end

  def file_close
    @file.close
  end

  def read_request
    result = @file.readline
    # File.readline(booking_requests)
  end

  def max_booking
    MAXBOOKING
  end
end