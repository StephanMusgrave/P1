require 'cinema'

describe Cinema do
let (:odeon) { Cinema.new(100,50) }
  
  it 'should have 50 seats in a row' do
    expect(odeon.seats).to eq 50
    # expect(odeon.cinema[0][0]).to eq nil
    expect(odeon.cinema[0].length).to eq 50
  end

it 'should have 100 rows' do
    expect(odeon.rows).to eq 100
    expect(odeon.cinema.length).to eq 100
  end


end