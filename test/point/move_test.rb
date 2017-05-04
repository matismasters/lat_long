class TestPointMove < Minitest::Test
  # The expected values here are from GoogleMaps, that way we test from
  # something completely agnostic of formula or algorithm
  def setup
    # 500 meters between each point as per GMaps
    @fst_and_17st_nw =            LatLong::Point.new(38.897343, (-77.039498))
    @washington_ave_and_17st_nw = LatLong::Point.new(38.892133, (-77.039498))
    @washington_ave_and_14st_nw = LatLong::Point.new(38.892133, (-77.033727))
  end

  def test_point_is_moved_east_500_meters
    moved_point = @washington_ave_and_17st_nw.move(500, :meters, :east)

    # Rounding to match GMaps precision
    assert_equal @washington_ave_and_14st_nw.lat, moved_point[:lat].round(6)
    assert_equal @washington_ave_and_14st_nw.long, moved_point[:long].round(6)
  end

  def test_point_is_moved_west_500_meters
    moved_point = @washington_ave_and_14st_nw.move(500, :meters, :west)

    assert_equal @washington_ave_and_17st_nw.lat, moved_point[:lat].round(6)
    assert_equal @washington_ave_and_17st_nw.long, moved_point[:long].round(6)
  end

  def test_point_is_moved_north_580_meters
    moved_point = @washington_ave_and_17st_nw.move(580, :meters, :north)

    assert_equal @fst_and_17st_nw.lat, moved_point[:lat].round(6)
    assert_equal @fst_and_17st_nw.long, moved_point[:long].round(6)
  end

  def test_point_is_moved_south_580_meters
    moved_point = @fst_and_17st_nw.move(580, :meters, :south)

    assert_equal @washington_ave_and_17st_nw.lat, moved_point[:lat].round(6)
    assert_equal @washington_ave_and_17st_nw.long, moved_point[:long].round(6)
  end
end
