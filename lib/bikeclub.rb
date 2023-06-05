class BikeClub
  attr_reader :name,
              :bikers

  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  def most_rides
    @bikers.max_by { |biker| biker.total_rides }
  end

  def bikers_eligible(ride)
    eligible = []
    @bikers.each do |biker|
      if biker.acceptable_terrain.include?(ride.terrain) && biker.max_distance >= ride.total_distance
        eligible << biker
      end
    end
    eligible
  end

  def record_holder(ride)
    @bikers.each do |biker|
      biker.rides.min_by { |ride|   }
    end
  end
end