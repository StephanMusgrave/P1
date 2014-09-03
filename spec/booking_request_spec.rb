require 'theatre'
require 'booking_request'

describe BookingRequest do
  let (:validbooking) { BookingRequest.new(0,1,5,1,7) }
  let (:invalidbooking) { BookingRequest.new(1,1,41,101,52) }
  let (:national)    { Cinema.new(100,50) }
  let (:globe) { Cinema.new(100,50) }

end
