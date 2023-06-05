require 'spec_helper'

describe Biker do
  before(:each) do
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  it "exists and has readable attributes" do
    expect(@biker).to be_a Biker
    expect(@biker.name).to eq("Kenny")
    expect(@biker.max_distance).to eq(30)
  end

  it "starts with an empty acceptable terrains array and can learn new terrains" do
    expect(@biker.acceptable_terrain).to eq([])

    @biker.learn_terrain!(:gravel)
    @biker.learn_terrain!(:hills)

    expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
  end

  it "starts with an empty rides array and can log rides" do
    @biker.log_ride(@ride1, 92.5)
    @biker.log_ride(@ride1, 91.1)
    @biker.log_ride(@ride2, 60.9)
    @biker.log_ride(@ride2, 61.6)

    expect(@biker.rides).to eq({
      @ride1 => [92.5, 91.1],
      @ride2 => [60.9, 61.6]
    })
  end

  it "can determine a biker's personal record for a specific ride" do
    @biker.log_ride(@ride1, 92.5)
    @biker.log_ride(@ride1, 91.1)
    @biker.log_ride(@ride2, 60.9)
    @biker.log_ride(@ride2, 61.6)

    expect(@biker.personal_record(@ride1)).to eq(91.1)
    expect(@biker.personal_record(@ride2)).to eq(60.9)
  end

  # it "cannot log rides for terrains the biker has not yet learned" do

  # end
end