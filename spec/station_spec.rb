require 'station'

describe Station do
  it 'has a name' do
    station = Station.new('Stratford', 3)
    expect(station.name).to eq('Stratford')
  end

  it 'had a zone' do 
    station = Station.new('Stratford', 3)
    expect(station.zone).to eq(3)
  end 
end  