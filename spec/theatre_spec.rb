require 'cinema'

describe Cinema do
  let (:odeon)    { Cinema.new(100,50) }

  context "at set up" do
  
    it 'should have 50 seats in a row' do
      expect(odeon.cinema[0].length).to eq 50
    end

    it 'should have 100 rows' do
      expect(odeon.cinema.length).to eq 100
    end

    it 'should have empty seats when created' do
      # odeon.display
      expect((odeon.cinema[0][0]).booked?).to be false
      expect((odeon.cinema[99][49]).booked?).to be false
    end

  end

  context "can have booked seats" do

    it 'should have full seats' do
      (odeon.cinema[0][0]).book!
      expect((odeon.cinema[0][0]).booked?).to be true
    end

 end
 
end