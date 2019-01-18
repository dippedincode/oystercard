require 'journey'

describe Journey do
  let(:in_station){ double :entry_station }
  let(:out_station){ double :exit_station }

  it { is_expected.to respond_to :entry_station }
  it { is_expected.to respond_to :exit_station }
  it { is_expected.to respond_to :start_journey }
  it { is_expected.to respond_to :stop_journey }
  it { is_expected.to respond_to :calculate_fare }
  it { is_expected.to respond_to :confirm_journey_complete? }
  
end
