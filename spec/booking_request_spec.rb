require 'booking_request'
require 'theatre'

describe BookingRequest do
  let(:booking_request) { BookingRequest.new({:id => 0, :startrow=>77, :firstseat=>23, :endrow=>77, :lastseat=>24}) }
  let(:booking_request2) { BookingRequest.new({:id => 0, :startrow=>77, :firstseat=>23, :endrow=>77}) }
  let(:booking_request3) { BookingRequest.new({:id => -1, :startrow=>77, :firstseat=>23, :endrow=>77, :lastseat=>24}) }
  let(:booking_request4) { BookingRequest.new({:id => 0, :startrow=>77, :firstseat=>23, :endrow=>78, :lastseat=>24}) }
  let(:booking_request5) { BookingRequest.new({:id => 0, :startrow=>101, :firstseat=>23, :endrow=>101, :lastseat=>24}) }
  let(:booking_request6) { BookingRequest.new({:id => 0, :startrow=>1, :firstseat=>23, :endrow=>1, :lastseat=>22}) }
  let(:booking_request7) { BookingRequest.new({:id => 0, :startrow=>1, :firstseat=>23, :endrow=>1, :lastseat=>33}) }
  let(:booking_request8) { BookingRequest.new({:id => 0, :startrow=>1, :firstseat=>48, :endrow=>1, :lastseat=>50}) }
  
  let (:theatre) { Theatre.new(100) }
  it 'is initialized with 5 key value pairs' do
    booking_request2 = BookingRequest.new({:id => 0, :startrow=>77, :firstseat=>23, :endrow=>77})
    expect(booking_request.all_fields_present?).to be true
    expect(booking_request2.all_fields_present?).to be false
  end

  it 'has a valid id' do
    booking_request3 = BookingRequest.new({:id => -1, :startrow=>77, :firstseat=>23, :endrow=>77, :lastseat=>24})
    expect(booking_request.valid_id?).to be true
    expect(booking_request3.valid_id?).to be false
  end

  it 'knows if the booking is all on a single row' do
    booking_request4 = BookingRequest.new({:id => 0, :startrow=>77, :firstseat=>23, :endrow=>78, :lastseat=>24})  
    expect(booking_request.single_row?).to be true
    expect(booking_request4.single_row?).to be false
  end

  it 'knows if the rows are valid' do
    booking_request5 = BookingRequest.new({:id => 0, :startrow=>101, :firstseat=>23, :endrow=>101, :lastseat=>24})
    expect(booking_request.valid_rows?(theatre)).to eq true
    expect(booking_request5.valid_rows?(theatre)).to eq false
  end 

  it 'knows that the the last seat is greater than or equal to the first seat' do
    booking_request6 = BookingRequest.new({:id => 0, :startrow=>1, :firstseat=>23, :endrow=>1, :lastseat=>22})
    expect(booking_request.seats_in_order?).to be true
    expect(booking_request6.seats_in_order?).to be false
  end

  it 'knows that the booking request is no greater than the maximum acceptable order' do
    booking_request7 = BookingRequest.new({:id => 0, :startrow=>1, :firstseat=>23, :endrow=>1, :lastseat=>33})
    expect(booking_request.size_checker(theatre)).to be true
    expect(booking_request7.size_checker(theatre)).to be false
  end

  it 'knows that the seats requested are within the size of the row' do
    booking_request8 = BookingRequest.new({:id => 0, :startrow=>1, :firstseat=>48, :endrow=>1, :lastseat=>50})
    expect(booking_request.within_row?(theatre)).to be true
    expect(booking_request8.within_row?(theatre)).to be false
  end

  it 'knows if all of the internal tests for the booking request pass' do
    expect(booking_request.valid?(theatre)).to be true
    expect(booking_request2.valid?(theatre)).to be false
    expect(booking_request3.valid?(theatre)).to be false
    expect(booking_request4.valid?(theatre)).to be false
    expect(booking_request5.valid?(theatre)).to be false
    expect(booking_request6.valid?(theatre)).to be false
    expect(booking_request7.valid?(theatre)).to be false
    expect(booking_request8.valid?(theatre)).to be false
  end







end
