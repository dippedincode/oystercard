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


