require 'cinema'

describe Cinema do
let (:odeon)    { Cinema.new(100,50) }
let (:everyman) { Cinema.new(100,50) }

  context "at set up" do
  
    it 'should have 50 seats in a row' do
      expect(odeon.auditorium[0].length).to eq 50
    end

    it 'should have 100 rows' do
      expect(odeon.auditorium.length).to eq 100
    end

    it 'should only have empty seats when created' do
      # display_cinema(odeon)
      expect(odeon.auditorium[0][0]).to eq 0
      expect(odeon.auditorium[0][49]).to eq 0
      expect(odeon.auditorium[99][0]).to eq 0
      expect(odeon.auditorium[99][49]).to eq 0
    end

  end

  context "when fully booked" do

    it 'should only have full seats' do
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