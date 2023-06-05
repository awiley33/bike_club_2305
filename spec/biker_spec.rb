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
end