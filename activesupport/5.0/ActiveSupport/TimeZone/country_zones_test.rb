require 'test/unit'
require 'active_support/values/time_zone'

class TestTimeZoneCountryZone < Test::Unit::TestCase

  def test_country_zones
    country_zones = ActiveSupport::TimeZone.country_zones(:jp)
    assert_instance_of(ActiveSupport::TimeZone, country_zones[0])
    assert_equal(['+09:00'], country_zones.map(&:formatted_offset))

    # 国によっては複数のタイムゾーンを持つ
    # アメリカ合衆国
    p ActiveSupport::TimeZone.country_zones(:us).sort_by(&:formatted_offset).map(&:name)
    # => ["Eastern Time (US & Canada)", "Indiana (East)", "Central Time (US & Canada)", "Arizona", "Mountain Time (US & Canada)", "Pacific Time (US & Canada)", "Alaska", "Hawaii"]
  end

end
