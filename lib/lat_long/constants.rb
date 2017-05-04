module LatLong
  DIRECTION_MULTIPLIERS = {
    west:       { y_axis: 0, x_axis: -1 },
    north_west: { y_axis: 1, x_axis: -1 },
    north:      { y_axis: 1, x_axis: 0 },
    north_east: { y_axis: 1, x_axis: 1 },
    east:       { y_axis: 0, x_axis: 1 },
    south_east: { y_axis: -1, x_axis: 1 },
    south:      { y_axis: -1, x_axis: 0 },
    south_west: { y_axis: -1, x_axis: -1 },
  }.freeze

  TO_METERS_MULTIPLIERS = {
    meters: 1,
    kilometers: 1000,
    miles: 0.000621371,
    feet: 3.28084
  }.freeze

  EARTH_RADIUS = 6378137.freeze
end
