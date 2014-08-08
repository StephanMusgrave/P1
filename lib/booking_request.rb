class BookingRequest

  def initialize(id,startrow,startseat,endrow,endseat)
    @booking_request =[id,startrow,startseat,endrow,endseat]
  end

  def id
    @booking_request[0]
  end

  def startrow
    @booking_request[1]
  end

  def startseat 
    @booking_request[2]
  end

  def endrow
    @booking_request[3]
  end

  def endseat
    @booking_request[4]
  end

  def booking_request
    @booking_request
  end

end

def check_row(row)
  result = row <= 99 ? true : false
  result
end

def check_seat(seat)
  result = seat <= 49 ? true :false
  result
end

def check_size(startseat,endseat)
  result = ((endseat-startseat+1) <= 5 && (endseat-startseat+1) >=1) ? true : false
end

def check_available(booking,cinema)
  available = true
  seat = booking.startseat
  while seat <= booking.endseat
    available = (available && (cinema.auditorium[booking.startrow][seat] == 0))
    seat = seat + 1
  end
  available
end

def check_singleton(booking,cinema)
  startseat = booking.startseat
  endseat = booking.endseat
  singleton = false
  singleton_before = false
  singleton_after = false
  singleton_before = true if ((cinema.auditorium[booking.startrow][startseat-1] == 0) && ((cinema.auditorium[booking.startrow][startseat-2] == 1) || (startseat - 2 < 0)))
  singleton_after  = true if ((cinema.auditorium[booking.startrow][endseat+1] == 0) && ((cinema.auditorium[booking.startrow][endseat+2] == 1) || (endseat + 2 > 49)))
  singleton_before = false if startseat == 0
  singleton_after = false if endseat == 49
  singleton = true if ((singleton_before == true) || (singleton_after == true))
  # puts "---" 
  # print cinema.auditorium[booking.startrow]; puts
  # print "startseat: ", startseat, ", endseat: ",endseat ; puts
  # print cinema.auditorium[booking.startrow][startseat-2],cinema.auditorium[booking.startrow][startseat-1]
  # print " <> ",cinema.auditorium[booking.startrow][endseat+1],cinema.auditorium[booking.startrow][endseat+2]
  # puts
  # print " before: ",singleton_before,", after: ",singleton_after,", singleton: ",singleton ; puts
  # puts "---" 
  singleton
end

def check_booking(booking,cinema)
  validity = (  check_row(booking.startrow) &&
                check_seat(booking.endseat) && 
                (booking.startrow == booking.endrow)
              )
  availability = check_available(booking,cinema)
  status = validity && availability 
  status
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

def make_booking(booking,cinema)
  seat = booking.startseat
  while seat <= booking.endseat
    cinema.auditorium[booking.startrow][seat] = 1
    seat = seat + 1
  end
end



