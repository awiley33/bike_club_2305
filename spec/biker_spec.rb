require 'spec_helper'

describe Biker do
  before(:each) do
    @biker = Biker.new("Kenny", 30)
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
end