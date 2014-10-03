require 'theatre'

describe Theatre do
  let (:national)    { Theatre.new(100, 50) }

  context 'at set up' do

    it 'should have 50 seats in a row' do
      expect(national.seats_per_row).to eq 50
    end

    it 'should have 100 rows' do
      expect(national.rows_per_theatre).to eq 100
    end

    it 'should have empty seats when created' do
      # national.display
      expect((national.seat(0, 0)).booked?).to be false
      expect((national.seat(99, 49)).booked?).to be false
    end

  end

  context 'booked seats' do

    it 'should have booked seats after booking' do
      (national.seat(0, 0)).book!
      expect((national.seat(0, 0)).booked?).to be true
    end

  end

end
