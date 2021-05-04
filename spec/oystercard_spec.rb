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

  describe '#deduct' do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deducts a specified amount from the balance' do
      subject.top_up(50)
      expect(subject.deduct(20)).to eq (30)
    end
    
    it 'raises an error if balance exceeds maximum' do

        subject.top_up(50)
        expect { subject.top_up(45) }.to raise_error "Exceeds maximum balance of #{described_class::MAX_BALANCE}"
    end
  end 
end