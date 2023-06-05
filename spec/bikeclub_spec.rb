require 'spec_helper'

describe BikeClub do
  before(:each) do
    @club1 = BikeClub.new("Cali Cruisers")
  end

  it "exists and has a name" do
    expect(@club1).to be_a BikeClub
    expect(@club1.name).to eq("Cali Cruisers")
  end

end