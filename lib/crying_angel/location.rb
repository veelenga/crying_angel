
module CryingAngel
  # Represents a location of the object on the first quarter
  # of a two-dimentional Castesian plane (x, y >= 0).
  class Location
    attr_reader :x, :y
    # Creates new Location object.
    #
    # @example
    #   Location.new(20, 30)
    #
    # @param x [Fixnum] represents x coordinate on two-dimendional
    #   Castesian plane. Should be >= 0.
    #
    # @param y [Fixnum] represents y coordinate on two-dimendional
    #   Castesian plane. Should be >= 0.
    #
    # @raise [ArgumentError] if "x" or "y" is negative.
    def initialize(x, y)
      fail ArgumentError, 'x should be >=0' if x < 0
      fail ArgumentError, 'y should be >=0' if y < 0
      @x, @y = x, y
    end

    # Calculates and returns a distance between current location
    # and "other_location".
    #
    # @example
    #   l1 = Location.new(20, 30)
    #   l1.distance_to Location.new(20, 35) # => 5.0
    #
    # @param other_location [Location] other location.
    #
    # @return distance between this location and "other_location".
    def distance_to(other_location)
      Math.hypot(@x - other_location.x, @y - other_location.y)
    end
  end
end
