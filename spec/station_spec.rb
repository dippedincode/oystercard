require 'station.rb'

describe Station do
  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :zone }


  # it "gives us a station name as a string" do 
  #   station = Station.new
  #   expect(subject.name).to be_kind_of String
  # end

end 