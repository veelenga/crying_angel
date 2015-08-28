
module CryingAngel
  # Represents an Angel, that someday was a Human and
  # can see a hole territory.
  class Angel < Human
    attr_reader :view_dist

    # Creates new Angel.
    #
    # @example
    #   Angel.new('Castiel', location, 500)
    #
    # @param name [String] Angel's name.
    #
    # @param location [Location] Angel's location.
    #
    # @param view_dist [Fixnum] number of kilometers Angel can see.
    #   Should be > 0.
    #
    # @raise ArgumentError if "view_dist" <= 0.
    def initialize(name, location, view_dist)
      fail ArgumentError, 'view_dist should be > 0' if view_dist <= 0

      super(name, location)
      @view_dist = view_dist
    end

    # Whether or not Angel can see a person defined by it's location.
    #
    # @param person person to check whether or not Angel can see.
    #   Position of the person should be defined by it's location.
    #
    # @return true if Angel can see a person, false otherwise.
    def can_see?(person)
      @location.distance_to(person.location) <= view_dist
    end
  end
end
