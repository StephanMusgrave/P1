class BookingRequest

  def initialize(id,startrow,startseat,endrow,endseat)
    @id = id
    @startrow = startrow
    @startseat = startseat
    @endrow = endrow
    @endseat = endseat
    @booking_request =[@id,@startrow,@startseat,@endrow,@endseat]
  end

  def id
    @id
  end

  def startrow
    @startrow
  end

  def startseat 
    @startseat
  end

  def endrow
    @endrow
  end

  def endseat
    @endseat
  end

  def booking_request
    @booking_request
  end

end

def checkrow(row)
  result = row <= 99 ? true : false
  result
end

def checkseat(seat)
  result = seat <= 49 ? true :false
  result
end

def checksize(startseat,endseat)
  result = ((endseat-startseat+1) <= 5 && (endseat-startseat+1) >=1) ? true : false
end

def get_bookings(filename)
  require 'csv'
  booking_table =[]
    CSV.open(filename, 'r').each do |booking|
      id = booking[0].gsub("(","").to_i
      startrow = booking[1].gsub(/\:\d+/,"").to_i
      startseat = booking[1].gsub(/\d+:/,"").to_i
      endrow = booking[2].gsub(/\:\d+/,"").to_i
      endseat = booking[2].gsub(/\d+:/,"").to_i
      booking = BookingRequest.new(id,startrow,startseat,endrow,endseat)
      booking_table << booking.booking_request
      # print booking.id," ",booking.startrow," ",booking.startseat," ",booking.endrow," ",booking.endseat ;puts
      # print booking, " ", id," ", startrow," ", startseat," ", endrow," ", endseat; puts
    end
  booking_table
end
