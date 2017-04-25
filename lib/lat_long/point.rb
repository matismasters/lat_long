module LatLong
  DIRECTION_MULTIPLIERS = {
    north: [1, 1],
    north_east: [1, 1],
    east: [1, 1],
    south_east: [-1, 1],
    south: [-1, 1],
    south_west: [-1, -1],
    west: [1, -1],
    north_west: [1, -1],
  }.freeze

  TO_METERS_MULTIPLIERS = {
    meters: 1,
    kilometers: 1000,
    miles: 0.000621371,
    feets: 3.28084
  }.freeze

  class Point
    ARGUMENT_ERRORS_TEXT = {
      direction:
        'direction argument is not supported, use any of the following ' +
        DIRECTION_MULTIPLIERS.keys.join(', '),
      distance_unit:
        'distance unit argument not supported, use any of the following ' +
        TO_METERS_MULTIPLIERS.keys.join(', '),
    }.freeze

    attr_reader :lat, :long

    def initialize(lat, long)
      @lat = lat
      @long = long
    end

    def starting_point
      [@lat, @long]
    end

    def move(distance, unit, direction)
      direction = direction_multipliers(direction)
      distance = distance_in_meters(distance, unit)
    end

    private

    def direction_multipliers(direction)
      DIRECTION_MULTIPLIERS[direction] ||
        raise(ArgumentError, ARGUMENT_ERRORS_TEXT[:direction])
    end

    def distance_in_meters(distance, unit)
      unit_multiplier = TO_METERS_MULTIPLIERS[unit] ||
        raise(ArgumentError, ARGUMENT_ERRORS_TEXT[:distance_unit])
      distance * unit_multiplier
    end
  end
end
