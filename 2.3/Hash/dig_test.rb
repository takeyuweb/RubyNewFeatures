require 'test/unit'


User = Struct.new(:name, :address)
Address = Struct.new(:country, :prefecture)


class TestDig < Test::Unit::TestCase
  def test_hash_dig
    hash = {
        customer: {
            name: 'Yuichi',
            age: 24,
            address: {
                country: 'Japan',
                prefecture: 'Saitama'
            }
        },
        orders: [
            {
                id: 1,
                amount: 1000
            }
        ]
    }

    assert_equal(hash.dig(:customer), hash[:customer])
    assert_nil(hash.dig(:hoge))

    assert_equal(hash.dig(:customer, :address, :country), 'Japan')  # hash[:customer][:address][:country]
    assert_nil(hash.dig(:customer, :address, :postalcode))

    assert_equal(hash.dig(:orders), hash[:orders])
    assert_equal(hash.dig(:orders, 0, :id), 1)                      # hash[:orders][0][:id]

    assert_raise(TypeError) { hash.dig(:customer, :age, :hoge) } # Fixnum does not have #dig method
  end

  def test_array_dig
    array = [
        0,
        [1 ,2],
        [3, 4, [5, 6]]
    ]
    assert_equal(array.dig(1), [1, 2])          # array[1]
    assert_nil(array.dig(3))

    assert_equal(array.dig(1, 0), 1)            # array[1][0]
    assert_nil(array.dig(1, 2))

    assert_raise(TypeError) { array.dig(0, 0) } # Fixnum does not have #dig method

    assert_equal(array.dig(2, 2, 0), 5)         # array[2][2][0]
  end

  def test_struct_dig
    user = User.new('Yuichi', Address.new('Japan', 'Saitama'))
    assert_equal(user.dig(:address, :country), 'Japan')
    assert_nil(user.dig(:address2, :country))
  end

  def test_complex_dig
    hash = {
        user: User.new('Yuichi', Address.new('Japan', 'Saitama')),
        orders: [
            {
                id: 1,
                amount: 1000
            },
            {
                id: 2,
                amount: 2000
            }
        ]
    }
    # Hash#dig Array#dig Struct#dig の組み合わせ
    # ダックタイピングによってこのようなネストも扱える
    assert_equal(hash.dig(:user, :address, :country), 'Japan')
    assert_equal(hash.dig(:orders, 0, :id), hash[:orders][0][:id])
    assert_nil(hash.dig(:orders, 0, :hoge))
    assert_nil(hash.dig(:orders, 2, :id))
  end

end
