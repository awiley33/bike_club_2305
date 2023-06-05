class Biker
  attr_reader :name,
              :max_distance,
              :rides,
              :acceptable_terrain,
              :total_rides
          
  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
    @total_rides = 0
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, time)
    if @max_distance >= ride.total_distance
      if @acceptable_terrain.include?(ride.terrain)
        ride.record_time(time)
        @rides.store(ride, ride.times)
        @total_rides += 1
      end
    end
  end

  def personal_record(ride)
    if @rides[ride]
      @rides[ride].min
    else
      false
    end
  end
end