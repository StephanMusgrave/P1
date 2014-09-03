require 'theatre'

describe Theatre do
  let (:national)    { Theatre.new(100,50) }

  context "at set up" do
  
    it 'should have 100 rows' do
      expect(national.theatre.length).to eq 100
    end

    it 'should have 50 seats in a row' do
      expect(national.theatre[0].length).to eq 50
    end

    it 'should have empty seats when created' do
      # national.display
      expect((national.theatre[0][0]).booked?).to be false
      expect((national.theatre[99][49]).booked?).to be false
    end

  end

  context "booked seats" do

    it 'should have booked seats after booking' do
      (national.theatre[0][0]).book!
      expect((national.theatre[0][0]).booked?).to be true
    end

 end
 
end