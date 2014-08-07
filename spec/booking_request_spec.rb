require 'booking_request'
require 'cinema'

describe BookingRequest do
  let (:booking) { BookingRequest.new(0,1,5,1,7) }
  let (:invalidbooking) { BookingRequest.new(1,1,41,101,52) }
  let (:odeon)    { Cinema.new(100,50) }

  context "content" do

    it 'should have an id' do
      expect(booking.id).to eq 0
    end

    it 'should have a starting row' do
      expect(booking.startrow).to eq 1
    end

    it 'should have a starting seat' do
      expect(booking.startseat).to eq 5 
    end

    it 'should have an ending row' do
      expect(booking.endrow).to eq 1 
    end

    it 'should have an ending seat' do
      expect(booking.endseat).to eq 7 
    end

  end

  context "valid booking data" do

    it 'should accept a row number <= 99' do
      expect(checkrow(booking.endrow)).to be true
    end

    it 'should accept a seat number <= 49' do
      expect(checkseat(booking.endseat)).to be true
    end

    it 'should accept a booking of between 1 and 5 seats' do
      expect(checksize(booking.startseat,booking.endseat)).to be true
    end
    
  end

  context "invalid booking data" do

    it 'should not accept a row number greater than 99' do
      expect(checkrow(invalidbooking.endrow)).to be false
    end

    it 'should not accept a seat number greater than 49' do
      expect(checkseat(invalidbooking.endseat)).to be false
    end

    it 'should not accept a booking of more than 5 seats' do
      expect(checksize(invalidbooking.startseat,invalidbooking.endseat)).to be false
    end

    it 'should not accept a booking of less than 1 seats' do
      smallbooking = BookingRequest.new(2,1,4,1,3)
      expect(checksize(smallbooking.startseat,smallbooking.endseat)).to be false
    end

    # syntax if checkrow is a class method
    # it 'should not accept a row number greater than 99' do
    #   expect(booking.checkrow(booking.endrow)).to be false
    # end
    
  end

  context "getting booking requests from a file" do

    it 'should be obtain 500 booking requests from the file sample_booking_requests' do
      request_list = get_bookings('data/sample_booking_requests')
      expect(request_list.length).to eq 500
    end

    it 'should be able to read the rows from the file sample_booking_requests' do
      request_list = get_bookings('data/sample_booking_requests')
      expect(request_list[0][1]).to eq 89
      expect(request_list[0][3]).to eq 89
      expect(request_list[499][1]).to eq 14
      expect(request_list[499][3]).to eq 14
    end

    it 'should be able to read the seats from the file sample_booking_requests' do
      request_list = get_bookings('data/sample_booking_requests')
      expect(request_list[0][2]).to eq 13
      expect(request_list[0][4]).to eq 13
      expect(request_list[499][2]).to eq 2
      expect(request_list[499][4]).to eq 4
    end

  end

  context 'checking a booking request for a Cinema' do
   
   it 'should be a valid booking' do
    expect(checkbooking(booking,odeon)).to be true
   end


  end


end