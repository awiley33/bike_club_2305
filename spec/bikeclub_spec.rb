require 'spec_helper'

describe BikeClub do
  before(:each) do
    @club1 = BikeClub.new("Cali Cruisers")
    @biker1 = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
  end

  it "exists and has a name" do
    expect(@club1).to be_a BikeClub
    expect(@club1.name).to eq("Cali Cruisers")
  end

  it "starts with an empty list of bikers and can add bikers to it" do
    expect(@club1.bikers).to eq([])

    @club1.add_biker(@biker1)
    @club1.add_biker(@biker2)

    expect(@club1.bikers).to eq([@biker1, @biker2])
  end
end