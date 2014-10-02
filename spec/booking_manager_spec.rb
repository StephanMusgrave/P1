require 'booking_manager'

describe BookingManager do

  let(:contents) { "(0,77:23,77:24),\n" }
  let(:contents2) { "(1,63:41,64:44),\n" }
  let (:theatre) { double :theatre, :rows_per_theatre => 100, 
                                    :seats_per_row => 50,
                                    :max_booking => 5 }
  let (:booking_manager) { BookingManager.new(theatre) } 
  
  it 'is initialized with a theatre' do
    expect(booking_manager.theatre).to eq theatre
  end

  it 'knows that the maximum acceptable booking is 5 seats' do
      expect(booking_manager.max_booking).to eq 5
  end

  it 'knows how many rows are in the theatre' do
    expect(booking_manager.rows).to eq 100
  end

  it 'knows how many seats are in each row of the theatre' do
    expect(booking_manager.seats).to eq 50
  end

  it 'can open a file of bookings' do
    # expect(booking_manager).to receive(:open_file).with('/data/booking_requests').and_return(contents)
    booking_manager.file_open('./data/test_booking_requests')
    expect(booking_manager.read_request).to eq contents
    expect(booking_manager.read_request).to eq contents2
    booking_manager.file_close
  end

  it 'can check a booking request for internal validity' do
    booking_manager.file_open('./data/test_booking_requests')
    booking_request_reader = BookingRequestReader.new
    test = BookingRequest.new(booking_request_reader.process(booking_manager.read_request))
    test2 = BookingRequest.new(booking_request_reader.process(booking_manager.read_request))
    booking_manager.file_close
    # This is wher we got to.  Should we try global varaibles?
    # expect(booking_manager.request_validity?(test, booking_manager.seats, booking_manager.max_booking, booking_manager.rows)).to be true
    expect(test2.valid?(booking_manager.seats, booking_manager.max_booking, booking_manager.rows )).to be false
  end

end


# it "returns the correct parsed content" do
#     File.should_receive(:read).with('/tmp/myfile').and_return(contents)
#     subject.read_file.should == contents
#   end
# end