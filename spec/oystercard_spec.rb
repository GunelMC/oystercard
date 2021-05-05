require 'oystercard'

describe OysterCard do 

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
      subject.touch_in
      expect(subject.in_journey?).to eq(true)
    end 

    it 'can touch in' do
      subject.top_up(10)
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'raises an error when touching in with balance below minimum fare' do
      expect { subject.touch_in }.to raise_error('You need to top up')
    end

    describe '#touch_out' do 

      it 'can touch out' do
        subject.top_up(10)
        subject.touch_in
        subject.touch_out
        expect(subject).not_to be_in_journey
      end

      it 'deducts the minimum fare from the card' do
        subject.top_up(10)
        subject.touch_in
        subject.touch_out
        expect(subject.balance).to eq(9)
      end
  end
end 