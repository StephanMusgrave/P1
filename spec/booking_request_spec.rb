require 'booking_request'
require 'theatre'

describe BookingRequest do
  let(:booking_request)  { BookingRequest.new({ :id => 0, :startrow => 77, :firstseat => 23, :endrow => 77, :lastseat => 24 }) }
  let(:booking_request2) { BookingRequest.new({ :id => 0, :startrow => 77, :firstseat => 23, :endrow => 77 }) }
  let(:booking_request3) { BookingRequest.new({ :id => -1, :startrow => 77, :firstseat => 23, :endrow => 77, :lastseat => 24 }) }
  let(:booking_request4) { BookingRequest.new({ :id => 0, :startrow => 77, :firstseat => 23, :endrow => 78, :lastseat => 24 }) }
  let(:booking_request5) { BookingRequest.new({ :id => 0, :startrow => 101, :firstseat => 23, :endrow => 101, :lastseat => 24 }) }
  let(:booking_request6) { BookingRequest.new({ :id => 0, :startrow => 1, :firstseat => 23, :endrow => 1, :lastseat => 22 }) }
  let(:booking_request7) { BookingRequest.new({ :id => 0, :startrow => 1, :firstseat => 23, :endrow => 1, :lastseat => 33 }) }
  let(:booking_request8) { BookingRequest.new({ :id => 0, :startrow => 1, :firstseat => 48, :endrow => 1, :lastseat => 50 }) }
  let (:booking_manager) { double :booking_manager, :max_booking => 5,
                                                    :rows => 100,
                                                    :seats => 50 }
  let (:max_booking)  { booking_manager.max_booking }
  let (:seats)  { booking_manager.seats }
  let (:rows)  { booking_manager.rows }

  let (:theatre) { Theatre.new(100) }

  it 'is initialized with 5 key value pairs' do
    expect(booking_request.all_fields_present?).to be true
    expect(booking_request2.all_fields_present?).to be false
  end

  it 'has a valid id' do
    expect(booking_request.valid_id?).to be true
    expect(booking_request3.valid_id?).to be false
  end

  it 'knows if the booking is all on a single row' do
    expect(booking_request.single_row?).to be true
    expect(booking_request4.single_row?).to be false
  end

  it 'knows if the rows are valid' do
    expect(booking_request.valid_rows?(rows)).to eq true
    expect(booking_request5.valid_rows?(rows)).to eq false
  end

  it 'knows that the the last seat is greater than or equal to the first seat' do
    expect(booking_request.seats_in_order?).to be true
    expect(booking_request6.seats_in_order?).to be false
  end

  it 'knows that the booking request is no greater than the maximum acceptable order' do
    expect(booking_request.size_checker(max_booking)).to be true
    expect(booking_request7.size_checker(max_booking)).to be false
  end

  it 'knows that the seats requested are within the size of the row' do
    expect(booking_request.within_row?(seats)).to be true
    expect(booking_request8.within_row?(seats)).to be false
  end

  it 'knows if all of the internal tests for the booking request pass' do
    expect(booking_request.valid?(seats, max_booking, rows)).to be true
    expect(booking_request2.valid?(seats, max_booking, rows)).to be false
    expect(booking_request3.valid?(seats, max_booking, rows)).to be false
    expect(booking_request4.valid?(seats, max_booking, rows)).to be false
    expect(booking_request5.valid?(seats, max_booking, rows)).to be false
    expect(booking_request6.valid?(seats, max_booking, rows)).to be false
    expect(booking_request7.valid?(seats, max_booking, rows)).to be false
    expect(booking_request8.valid?(seats, max_booking, rows)).to be false
  end

end
