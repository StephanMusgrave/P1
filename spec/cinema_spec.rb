require 'cinema'

describe Cinema do
  let (:odeon)    { Cinema.new(100,50) }
  let (:everyman) { Cinema.new(100,50) }

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

  context "when fully booked" do

    it 'should have full seats' do
      row = 0
      until row > 99
        everyman.auditorium[row].map! {|x| 1 }
        row = row + 1
      end
      # display_cinema(everyman)
      expect(everyman.auditorium[0][0]).to eq 1
      expect(everyman.auditorium[0][49]).to eq 1
      expect(everyman.auditorium[99][0]).to eq 1
      expect(everyman.auditorium[99][49]).to eq 1

    end

 end
 
end