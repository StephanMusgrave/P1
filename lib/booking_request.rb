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
