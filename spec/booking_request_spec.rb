require 'booking_request'

describe BookingRequest do
  let (:booking) { BookingRequest.new(0,1,5,1,7) }
  let (:invalidbooking) { BookingRequest.new(1,1,51,101,52) }

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
    
  end

  context "invalid booking data" do

    it 'should not accept a row number greater than 99' do
      expect(checkrow(invalidbooking.endrow)).to be false
    end

    it 'should not accept a seat number greater than 49' do
      expect(checkseat(invalidbooking.endseat)).to be false
    end

    # syntax if checkrow is a class method
    # it 'should not accept a row number greater than 99' do
    #   expect(booking.checkrow(booking.endrow)).to be false
    # end
    
  end

end