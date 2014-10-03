require 'booking_request_reader.rb'

describe BookingRequestReader do

  it 'should read a line from a file of booking requests' do
    bookingrequestreader = BookingRequestReader.new
    expect(bookingrequestreader.process("(0,77:23,77:24),")).to eq ({ :id => 0, :startrow => 77,
                                              :firstseat => 23, :endrow => 77, :lastseat => 24 })
  end

end
