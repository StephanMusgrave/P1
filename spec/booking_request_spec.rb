require 'booking_request'

describe BookingRequest do

  it 'should have an id' do
    first_request = BookingRequest.new
    expect(first_request.id).to eq 0
  end

  it 'should have a starting row' do
    first_request = BookingRequest.new
    expect(first_request.startrow).to eq 0
  end


end