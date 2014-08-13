require "seat"

describe Seat do
  let(:seat){ Seat.new}

  it 'is empty when created' do
    expect(Seat.new).not_to be_booked
  end



end