require 'process_bookings'
require 'cinema'
require 'booking_request'

describe "Processing a file of booking requests" do
  let (:odeon)    { Cinema.new(100,50) }

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

  context "processing the bookings from the file file sample_booking_requests" do

    it 'should read the booking requests from the file' do
      empire = Cinema.new(100,50)
      file = "data/sample_booking_requests"
      process_bookings('data/sample_booking_requests',empire)
      expect(empire.auditorium[0][0]).to eq 0
      # expect()
    end

    xit 'should read, check and make each booking if valid' do
      # request_list = get_bookings('data/sample_booking_requests')
      # puts request_list[1]
      # request_list.each { |booking| puts booking }
      #   if check_booking(booking,odeon) == true
      #     make_booking(booking,odeon)
      #   else
      #     puts "invalid booking"
      #   end
      # }      
    end




  end



end