require 'station.rb'

describe Station do
  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :zone }

  subject  { described_class.new("Aldgate", "1") }

  it "Tests to see if station name is remembered" do 
    expect(subject.name).to eq("Aldgate")
  end 

  it "Tests to see if it remebers its zone" do
    expect(subject.zone).to eq("1")
  end 
end 




# describe Station do
#   it "gives us a station name as a string" do 
#     station = Station.new("tooting")
#     expect(station.name).to be_kind_of String
#   end

# end 