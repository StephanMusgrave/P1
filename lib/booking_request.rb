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

