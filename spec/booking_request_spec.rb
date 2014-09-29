require 'booking_request'
require 'theatre'

describe BookingRequest do
  let(:booking_request) { BookingRequest.new({:id => 0, :startrow=>77, :firstseat=>23, :endrow=>77, :lastseat=>24}) }
  let (:theatre) { Theatre.new(100) }
  it 'is initialized with 5 key value pairs' do
    booking_request2 = BookingRequest.new({:id => 0, :startrow=>77, :firstseat=>23, :endrow=>77})
    expect(booking_request.all_fields?).to be true
    expect(booking_request2.all_fields?).to be false
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

  it 'knows if the rows are vaild' do
    booking_request5 = BookingRequest.new({:id => 0, :startrow=>101, :firstseat=>23, :endrow=>101, :lastseat=>24})
    expect(booking_request.valid_rows?(theatre)).to eq true
    expect(booking_request5.valid_rows?(theatre)).to eq false
  end 

  it 'knows that the the last seat is greater than or equal to the first seat' do
    booking_request6 = BookingRequest.new({:id => 0, :startrow=>1, :firstseat=>23, :endrow=>1, :lastseat=>22})
    expect(booking_request.check_seat_order).to be true
    expect(booking_request6.check_seat_order).to be false
  end

  it 'knows that the booking request is no greater than the maximum acceptable order' do
    booking_request7 = BookingRequest.new({:id => 0, :startrow=>1, :firstseat=>23, :endrow=>1, :lastseat=>33})
    expect(booking_request.sizechecker(theatre)).to be true
    expect(booking_request7.sizechecker(theatre)).to be false
  end


end
