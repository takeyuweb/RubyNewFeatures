require 'test/unit'

class TestUnifyFixnumAndBignum < Test::Unit::TestCase

  def test_fixnum
    # 2.3まではFixnum
    assert_not_equal('Fixnum', 100000.class.name)
    assert_equal('Integer', 100000.class.name)
  end

  def test_bignum
    # 2.3まではBignum
    assert_not_equal('Bignum', (100000 * 100000).class.name)
    assert_equal('Integer', (100000 * 100000).class.name)
  end

end