require 'oystercard'

describe OysterCard do
  let(:entry_station) { double :station, :name => 'Stratford' }
  let(:exit_station) { double :station, :name => 'Maida Vale' }
  let(:journey) { {entry: entry_station, exit: exit_station} }

    it 'stores the entry station' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq(entry_station)
    end

    it 'has an empty list of journeys by default' do
      expect(subject.journeys).to eq([])
    end 


     it 'creates one journey after a touch in and touch out' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include journey
    end 

    it 'has a balance' do 
        expect(subject.balance).to eq 0
    end

  describe '#top_up' do

    it 'has a top-up value' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it 'increments the balance by given amount' do
      expect { subject.top_up(50) }.to change {subject.balance}.by(50)
    end
  end
    
    it 'raises an error if balance exceeds maximum' do
      subject.top_up(50)
      expect { subject.top_up(45) }.to raise_error "Exceeds maximum balance of #{described_class::MAX_BALANCE}"
    end

    it 'is in journey' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect(subject.in_journey?).to eq(true)
    end 

    it 'can touch in' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect(subject.in_journey?).to eq(true)
    end

    it 'raises an error when touching in with balance below minimum fare' do
      expect { subject.touch_in(entry_station) }.to raise_error('You need to top up')
    end

    describe '#touch_out' do 

      it 'can touch out' do
        subject.top_up(10)
        subject.touch_in(entry_station)
        subject.touch_out(exit_station)
        expect(subject.in_journey?).to eq(false)
      end

      it 'deducts the minimum fare from the card' do
        subject.top_up(10)
        expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by(-OysterCard::MINIMUM_FARE)
      end
  end
end 