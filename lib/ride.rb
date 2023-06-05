class Ride
  attr_reader :name,
              :distance,
              :terrain
  
  def initialize(info)
    @info = info
    @name = info[:name]
    @distance = info[:distance]
    @terrain = info[:terrain]
  end

  def loop?
    @info[:loop]
  end

  def total_distance
    if loop? == true
      @distance
    else
      @distance * 2
    end
  end
end