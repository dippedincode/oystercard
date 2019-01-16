require 'oystercard'

describe Oystercard do
  it { is_expected.to respond_to :balance }
  it { is_expected.to respond_to(:deduct).with(1).argument }
  it { is_expected.to respond_to :in_journey? }

  describe '#balance' do
    it 'has a default balance of 0' do
      expect(subject.balance).to eq 0
    end
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  describe '#top_up' do
    it 'tops up' do
      expect{ subject.top_up 5 }.to change{ subject.balance }.by 5
    end
    it 'prevents balance exceeding 90' do
      message = "Cannot Top-up: Balance cannot exceed 90"
      expect { subject.top_up(100) }.to raise_error(message)
    end
  end
  
  describe '#deduct' do
    it 'deducts balance by specified amount' do
      expect {subject.deduct(5) }.to change{ subject.balance }.by -5
    end
  end

  describe '#in_journey?' do
    describe 'tells us' do
      it 'initially card is not in journey' do
        expect(subject).to_not be_in_journey
      end
    end

    describe 'should be true' do
      it 'when card touches in' do
        subject.top_up(10)
        subject.touch_in
        expect(subject).to be_in_journey
      end
    end

    describe 'should be false' do
      it 'when card touches out' do
        subject.top_up(10)
        subject.touch_in
        subject.touch_out
        expect(subject).to_not be_in_journey
      end
    end

    describe '#touch_in' do
      # it 'tops up' do
      #   expect{ subject.top_up 5 }.to change{ subject.balance }.by 5
      # end
      it 'prevents journey happening' do
        message = "Cannot Travel: Balance too low"
        expect { subject.touch_in }.to raise_error(message)
      end
    end

  end

end
