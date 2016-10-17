require 'test/unit'

class TestIntegerDigits < Test::Unit::TestCase

  def test_digits
    assert_equal([7, 6, 5, 4, 3, 2, 1], 1234567.digits)
    assert_equal([7, 6, 5, 4, 3, 2, 1], 1234567.digits(10))
    assert_equal([67, 45, 23, 1], 1234567.digits(100))
    assert_equal([567, 234, 1], 1234567.digits(1000))
  end

  def test_zero
    assert_equal([0], 0.digits)
  end

  def test_negative
    assert_raise_kind_of(Math::DomainError) { -100.digits }
  end

  def test_binary_notation
    assert_equal(
        [0, # 100 ÷ 2 = 50 余り 0
         0, #  50 ÷ 2 = 25 余り 0
         1, #  25 ÷ 2 = 12 余り 1
         0, #  12 ÷ 2 =  6 余り 0
         0, #   6 ÷ 2 =  3 余り 0
         1, #   3 ÷ 2 =  1 余り 1
         1, #   1 ÷ 2 =  0 余り 1
        ],
        100.digits(2))
  end

  def test_octal_notation
    assert_equal(
        [4, # 100 ÷ 8 = 12 余り 4
         4, #  12 ÷ 8 =  1 余り 4
         1, #   1 ÷ 8 =  0 余り 1
        ],
        100.digits(8))
  end

  def test_quinary_notation
    assert_equal(
        [3, # 5213 ÷ 5 = 1042 余り 3
         2, # 1042 ÷ 5 =  208 余り 2
         3, #  208 ÷ 5 =   41 余り 3
         1, #   41 ÷ 5 =    8 余り 1
         3, #    8 ÷ 5 =    1 余り 3
         1, #    1 ÷ 5 =    0 余り 1
        ],
        5213.digits(5))
  end


end