require 'oystercard'

RSpec.describe Oystercard do
  it { is_expected.to respond_to :balance }
  describe '#balance' do
    it 'has a default balance of 3' do
      expect(subject.balance).to eq 3
    end
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  describe '#top_up' do
    it 'tops up' do
      expect(subject.top_up(5)).to eq 8
    end
  end
end