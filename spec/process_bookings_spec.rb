require 'process_bookings'
require 'cinema'
require 'booking_request'

describe "Processing a file of booking requests" do
  let (:odeon)    { Cinema.new(100,50) }
  let (:validbooking) { BookingRequest.new(0,1,5,1,7) }

  context "getting booking requests from a file" do

    it 'should obtain 500 booking requests from the file sample_booking_requests' do
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



end