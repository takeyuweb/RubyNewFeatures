require 'test/unit'
require 'active_support'
require 'active_support/core_ext/numeric'

class TestBytesConversion < Test::Unit::TestCase

  def test_bytes_conversion
    assert_equal(1, 1.byte)
    assert_equal(1024, 1.kilobyte)
    assert_equal(1024 ** 2, 1.megabyte)
    assert_equal(1024 ** 3, 1.gigabyte)
    assert_equal(1024 ** 4, 1.terabyte)
    assert_equal(1024 ** 5, 1.petabyte)
    assert_equal(1024 ** 6, 1.exabyte)

    # alias
    assert_equal(2, 2.bytes)
    assert_equal(1024 * 2, 2.kilobytes)
    assert_equal(1024 ** 2 * 2, 2.megabytes)
    assert_equal(1024 ** 3 * 2, 2.gigabytes)
    assert_equal(1024 ** 4 * 2, 2.terabytes)
    assert_equal(1024 ** 5 * 2, 2.petabytes)
    assert_equal(1024 ** 6 * 2, 2.exabytes)
  end

end
