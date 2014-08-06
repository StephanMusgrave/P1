require 'cinema'

describe Cinema do
let (:odeon) { Cinema.new(100,50) }
  
  it 'should have 50 seats in a row' do
    expect(odeon.seats).to eq 50
  end



end