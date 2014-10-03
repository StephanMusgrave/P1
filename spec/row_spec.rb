require 'row'

describe Row do

it 'should by default have 50 seats' do
  row = Row.new
  expect(row.size).to eq 50
end

it 'can be created with a specified number of seats' do
  row = Row.new(60)
  expect(row.size).to eq 60
end

it 'can check the status of a seat within itself' do
  row = Row.new
  expect(row.seats[3].booked?).to be false
end

end
