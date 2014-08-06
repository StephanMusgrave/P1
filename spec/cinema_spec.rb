require 'cinema'

describe Cinema do
let (:odeon) { Cinema.new(100,50) }
  
  context "set up" do
  
    it 'should have 50 seats in a row' do
      expect(odeon.auditorium[0].length).to eq 50
    end

    it 'should have 100 rows' do
      expect(odeon.auditorium.length).to eq 100
    end

    it 'should have only empty seats' do
      expect(odeon.auditorium[0][0]).to eq nil
      expect(odeon.auditorium[0][49]).to eq nil
      expect(odeon.auditorium[99][0]).to eq nil
      expect(odeon.auditorium[99][49]).to eq nil
    end

  end

end