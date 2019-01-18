require 'oystercard'

describe Oystercard do
  let(:in_station){ double :in_station }
  let(:out_station){ double :out_station }

  it { is_expected.to respond_to :balance }
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
  
  describe '#in_journey?' do
    describe 'tells us' do
      it 'initially card is not in journey' do
        expect(subject).to_not be_in_journey
      end
    end

    describe 'should be true' do
      it 'when card touches in' do
        subject.top_up(10)
        subject.touch_in(in_station)
        expect(subject).to be_in_journey
      end
    end

    describe 'should be false' do
      it 'when card touches out' do
        subject.top_up(10)
        subject.touch_in(in_station)
        subject.touch_out(out_station)
        expect(subject).to_not be_in_journey
      end
    end

    describe '#touch_in' do
      it 'prevents journey happening' do
        message = "Cannot Travel: Balance too low"
        expect { subject.touch_in(in_station) }.to raise_error(message)
      end

      it 'records entry_station' do
        subject.top_up(10)
        subject.touch_in(in_station)
        expect(subject.entry_station).to eq(in_station)
      end

    end

    describe '#touch_out' do
      it 'deducts correct journey fare' do
        subject.top_up(10)
        subject.touch_in(in_station)
        expect { subject.touch_out(out_station) }.to change{ subject.balance }.by -(Oystercard::MINIMUM_CHARGE)
      end

      it 'forgets entry_station and records exit station and puts journey in array' do
        subject.top_up(10)
        subject.touch_in(in_station)
        subject.touch_out(out_station)
        expect(subject.entry_station).to be_nil
        expect(subject.this_journey).to eq({:start => in_station, :end => out_station})
        expect(subject.all_journeys.last).to eq(subject.this_journey)
      end

    end

  end

end
