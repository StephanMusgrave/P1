require 'theatre'

describe Theatre do
  let (:national)    { Theatre.new(100,50) }

  context "at set up" do
  
    it 'should have 100 rows' do
      expect(national.theatre.length).to eq 100
    end

    it 'should have 50 seats in a row' do
      expect(national.theatre[0].size).to eq 50
    end

    it 'should have empty seats when created' do
      # national.display
      expect((national.seat(0,0)).booked?).to be false
      expect((national.seat(99,49)).booked?).to be false
    end

    it 'knows that the maximum acceptable booking is 5 seats' do
      expect(national.max_booking).to eq 5
    end

  end

  context "booked seats" do

    it 'should have booked seats after booking' do
      (national.theatre[0].seats[0]).book!
      expect((national.theatre[0].seats[0]).booked?).to be true
    end

 end
 
end