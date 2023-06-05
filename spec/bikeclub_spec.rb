require 'spec_helper'

describe BikeClub do
  before(:each) do
    @club1 = BikeClub.new("Cali Cruisers")
    @biker1 = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
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

  it "can tell us which Biker has logged the most rides" do
    @club1.add_biker(@biker1)
    @club1.add_biker(@biker2)
    @biker1.learn_terrain!(:gravel)
    @biker1.learn_terrain!(:hills)
    @biker2.learn_terrain!(:gravel)
    @biker2.learn_terrain!(:hills)
    @biker1.log_ride(@ride1, 92.5)
    @biker1.log_ride(@ride2, 61.6)
    @biker2.log_ride(@ride2, 65.0)

    expect(@club1.most_rides).to eq(@biker1)
  end

  it "can tell us which Bikers are eligible for a given Ride. A Biker is eligible for a Ride if the terrain is acceptable to them and the total distance does not exceed their max distance" do
    @club1.add_biker(@biker1)
    @club1.add_biker(@biker2)
    @biker1.learn_terrain!(:gravel)
    @biker1.learn_terrain!(:hills)
    @biker2.learn_terrain!(:hills)
    
    expect(@club1.bikers_eligible(@ride1)).to eq([@biker1])
    expect(@club1.bikers_eligible(@ride2)).to eq([@biker1])
    
    @biker2.learn_terrain!(:gravel)
    
    expect(@club1.bikers_eligible(@ride2)).to eq([@biker1, @biker2])
  end

  it "can tell us which Biker has the best time for a given Ride" do
    @club1.add_biker(@biker1)
    @club1.add_biker(@biker2)
    @biker1.learn_terrain!(:gravel)
    @biker1.learn_terrain!(:hills)
    @biker2.learn_terrain!(:gravel)
    @biker2.learn_terrain!(:hills)
    @biker1.log_ride(@ride1, 92.5)
    @biker1.log_ride(@ride1, 91.1)
    @biker1.log_ride(@ride2, 60.9)
    @biker1.log_ride(@ride2, 61.6)
    @biker2.log_ride(@ride2, 65.0)
    @biker2.log_ride(@ride2, 60.5)

    # expect(@club1.record_holder(@ride1).to eq(@biker1))
    expect(@club1.record_holder(@ride2)).to eq(@biker2)
  end
end