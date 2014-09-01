require 'theatre'

describe Theatre do
  let (:odeon)    { Theatre.new(100,50) }

  context "at set up" do
  
    it 'should have 50 seats in a row' do
      expect(odeon.theatre[0].length).to eq 50
    end

    it 'should have 100 rows' do
      expect(odeon.theatre.length).to eq 100
    end

    it 'should have empty seats when created' do
      # odeon.display
      expect((odeon.theatre[0][0]).booked?).to be false
      expect((odeon.theatre[99][49]).booked?).to be false
    end

  end

  context "can have booked seats" do

    it 'should have full seats' do
      (odeon.theatre[0][0]).book!
      expect((odeon.theatre[0][0]).booked?).to be true
    end

 end
 
end