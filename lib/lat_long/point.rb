module LatLong
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
      @direction = direction_multipliers(direction)
      @distance = distance_in_meters(distance, unit)

      y_distance_to_move_in_meters = @distance * @direction[:y_axis]
      x_distance_to_move_in_meters = @distance * @direction[:x_axis]

      lat_offset = y_distance_to_move_in_meters / EARTH_RADIUS
      long_offset = x_distance_to_move_in_meters / (
        EARTH_RADIUS * Math.cos(Math::PI * @lat/180)
      )

      new_point_lat = @lat + lat_offset * 180/Math::PI
      new_point_long = @long + long_offset * 180/Math::PI

      [new_point_lat, new_point_long]
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
