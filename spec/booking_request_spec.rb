require 'booking_request'
require 'cinema'

describe BookingRequest do
  let (:validbooking) { BookingRequest.new(0,1,5,1,7) }
  let (:invalidbooking) { BookingRequest.new(1,1,41,101,52) }
  let (:odeon)    { Cinema.new(100,50) }
  let (:everyman) { Cinema.new(100,50) }

  context "content" do

    it 'should have an id' do
      expect(validbooking.id).to eq 0
    end

    it 'should have a starting row' do
      expect(validbooking.startrow).to eq 1
    end

    it 'should have a starting seat' do
      expect(validbooking.startseat).to eq 5 
    end

    it 'should have an ending row' do
      expect(validbooking.endrow).to eq 1 
    end

    it 'should have an ending seat' do
      expect(validbooking.endseat).to eq 7 
    end

  end

  context "valid booking data" do

    it 'should accept a row number <= 99' do
      expect(check_row(validbooking.endrow)).to be true
    end

    it 'should accept a seat number <= 49' do
      expect(check_seat(validbooking.endseat)).to be true
    end

    it 'should accept a booking of between 1 and 5 seats' do
      expect(check_size(validbooking.startseat,validbooking.endseat)).to be true
    end
    
  end

  context "invalid booking data" do

    it 'should not accept a row number greater than 99' do
      expect(check_row(invalidbooking.endrow)).to be false
    end

    it 'should not accept a seat number greater than 49' do
      expect(check_seat(invalidbooking.endseat)).to be false
    end

    it 'should not accept a booking of more than 5 seats' do
      expect(check_size(invalidbooking.startseat,invalidbooking.endseat)).to be false
    end

    it 'should not accept a booking of less than 1 seats' do
      smallbooking = BookingRequest.new(2,1,4,1,3)
      expect(check_size(smallbooking.startseat,smallbooking.endseat)).to be false
    end
    
  end

  context 'a booking request for a Cinema' do
   
   it 'should be a valid booking' do
    expect(check_booking(validbooking,odeon)).to be true
   end

   it 'should add a valid booking to the Cinema' do
    make_booking(validbooking,odeon)
    # display_cinema(odeon)
    expect(odeon.auditorium[1][4]).to eq 0
    expect(odeon.auditorium[1][5]).to eq 1
    expect(odeon.auditorium[1][6]).to eq 1
    expect(odeon.auditorium[1][7]).to eq 1
    expect(odeon.auditorium[1][8]).to eq 0
   end

   it 'should not make a booking if any of the seats are already booked' do
    row = 0
      until row > 99
        everyman.auditorium[row].map! {|x| 1 }
        row = row + 1
      end
    expect(check_available(validbooking,odeon)).to be true
    expect(check_available(validbooking,everyman)).to be false
   end

   it 'should not make a booking if it would leave one empty seat at either end of the block' do
     make_booking(validbooking,odeon)
     # display_cinema(odeon)
     booking2 = BookingRequest.new(0,1,0,1,4)
     booking3 = BookingRequest.new(0,1,1,1,4)
     booking4 = BookingRequest.new(0,1,9,1,9)
     booking5 = BookingRequest.new(0,1,49,1,49)
     booking6 = BookingRequest.new(0,1,48,1,48)
     booking7 = BookingRequest.new(0,1,3,1,3)
     booking8 = BookingRequest.new(0,1,2,1,2)
     expect(check_singleton(booking2,odeon)).to be false
     expect(check_singleton(booking3,odeon)).to be true
     expect(check_singleton(booking4,odeon)).to be true
     expect(check_singleton(booking5,odeon)).to be false
     expect(check_singleton(booking6,odeon)).to be true
     expect(check_singleton(booking8,odeon)).to be false
   end


  end


end