require 'booking_request'

describe BookingRequest do
  let (:booking) { BookingRequest.new(0,1,5,1,7)}

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


end