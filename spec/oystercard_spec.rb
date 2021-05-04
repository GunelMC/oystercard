require 'oystercard'

describe Oystercard do 
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

    it 'raises an error if balance exceeds maximum' do

        subject.top_up(50)
        expect { subject.top_up(45) }.to raise_error "Exceeds maximum balance of #{described_class::MAX_BALANCE}"
    end
  end 
end