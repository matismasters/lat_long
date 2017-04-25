require 'minitest/autorun'

class TestPoint < Minitest::Test
  def setup
    @point = LatLong::Point.new (-34.902855), (-56.184383)
  end

  def test_directions_do_not_raise_an_error_when_valid_direction_argument
    LatLong::DIRECTION_MULTIPLIERS.keys.each do |direction|
      @point.move(10, :meters, direction)
    end
  end

  def test_directions_raise_an_error_when_invalid_direction_argument
    assert_raises ArgumentError do
      @point.move(10, :meters, :wrong_direction)
    end
  end

  def test_distance_unit_do_not_raise_an_error_when_valid_unit_argument
    LatLong::TO_METERS_MULTIPLIERS.keys.each do |unit|
      @point.move(10, unit, :north)
    end
  end

  def test_distance_unit_raise_an_error_when_invalid_unit_argument
    assert_raises ArgumentError do
      @point.move(10, :wrong_unit, :north)
    end
  end
end
