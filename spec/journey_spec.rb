require 'journey'

describe Journey do
  let(:in_station){ double :entry_station }
  let(:out_station){ double :exit_station }

  it { is_expected.to respond_to :entry_station }
end
