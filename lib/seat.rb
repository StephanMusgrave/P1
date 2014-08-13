class Seat

  def initialize
    empty!
  end

  def booked?
    @booked
  end

  def book!
    @booked = true
  end

  def empty!
    @booked = false
  end


end