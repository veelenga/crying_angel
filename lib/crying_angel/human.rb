
module CryingAngel
  # Represents a Human with it's name and location.
  class Human
    attr_reader :name, :location

    # Creates new Human.
    #
    # @example
    #   Human.new('John', location)
    #
    # @param name [String] Human's name
    #
    # @param location [Location] Human's location
    def initialize(name, location)
      @name = name
      @location = location
    end

    # Moves Human to the new location
    #
    # @example
    #   human.move_to(new_location)
    #
    # @param location [Location] new Human's location
    def move_to(location)
      @location = location
    end
  end
end
