class BookingRequest

  def initialize(id,startrow,startseat,endrow,endseat)
    @id = id
    @startrow = startrow
    @startseat = startseat
    @endrow = endrow
    @endseat = endseat
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

def get_booking(filename)
  require 'csv'
  CSV.open(filename, 'r').each do |booking|
    id = booking[0].gsub("(","").to_i
    startrow = booking[1].gsub(/\:\d+/,"").to_i
    startseat = booking[1].gsub(/\d+:/,"").to_i
    endrow = booking[2].gsub(/\:\d+/,"").to_i
    endseat = booking[2].gsub(/\d+:/,"").to_i
    print booking.inspect, " ", id," ", startrow," ", startseat," ", endrow," ", endseat
    puts
end
  # bookingfile = File.open(filename)
  # booking = bookingfile.readline
  # print booking
  # bookingfile.close
  # # true
end
