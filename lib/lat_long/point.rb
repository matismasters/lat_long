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

    def move(raw_distance, unit, direction)
      direction = direction_multipliers(direction)
      distance = distance_in_meters(raw_distance, unit)

      lat_offset = distance / EARTH_RADIUS
      long_offset = distance / (
        EARTH_RADIUS * Math.cos(Math::PI * @lat/180)
      )

      new_point_lat = @lat + (lat_offset * 180/Math::PI) * direction[:y_axis]
      new_point_long = @long + (long_offset * 180/Math::PI) * direction[:x_axis]

      { lat: new_point_lat, long: new_point_long }
    end

    private

    def direction_multipliers(direction)
      DIRECTION_MULTIPLIERS[direction] ||
        raise(ArgumentError, ARGUMENT_ERRORS_TEXT[:direction])
    end

    def distance_in_meters(distance, unit)
      unit_multiplier = TO_METERS_MULTIPLIERS[unit] ||
        raise(ArgumentError, ARGUMENT_ERRORS_TEXT[:distance_unit])
      distance.to_f * unit_multiplier
    end
  end
end
