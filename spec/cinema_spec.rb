require 'cinema'

describe Cinema do
let (:odeon)    { Cinema.new(100,50) }
let (:everyman) { Cinema.new(100,50) }
# row = 0
# until row > 99
#   odeon.auditorium[row].map! {|x| 1 }
# #   row = row + 1
# end
# puts odeon.auditorium

  context "at set up" do
  
    it 'should have 50 seats in a row' do
      expect(odeon.auditorium[0].length).to eq 50
    end

    it 'should have 100 rows' do
      expect(odeon.auditorium.length).to eq 100
    end

    it 'should have only empty seats when created' do
      expect(odeon.auditorium[0][0]).to eq nil
      expect(odeon.auditorium[0][49]).to eq nil
      expect(odeon.auditorium[99][0]).to eq nil
      expect(odeon.auditorium[99][49]).to eq nil
    end

  end

  context "when fully booked" do

    it 'should have only full seats' do
      row = 0
      until row > 99
        everyman.auditorium[row].map! {|x| 1 }
        row = row + 1
      end
      expect(everyman.auditorium[0][0]).to eq 1
      expect(everyman.auditorium[0][49]).to eq 1
      expect(everyman.auditorium[99][0]).to eq 1
      expect(everyman.auditorium[99][49]).to eq 1
    end
  end

end