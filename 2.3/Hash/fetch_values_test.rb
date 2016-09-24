require 'test/unit'

class TestHashFetchValues < Test::Unit::TestCase
  def test_fetch_values
    hash = {
        apple: 'りんご',
        banana: 'バナナ',
        orange: 'みかん'
    }
    assert_equal(%w(りんご バナナ), hash.fetch_values(:apple, :banana))
    assert_equal(%w(バナナ りんご), hash.fetch_values(:banana, :apple))
  end

  def test_missing_without_block
    hash = {
        apple: 'りんご',
        banana: 'バナナ',
        orange: 'みかん'
    }
    assert_raise(KeyError) { hash.fetch_values(:apple, :pineapple) }
  end

  def test_missing_with_block
    hash = {
        apple: 'りんご',
        banana: 'バナナ',
        orange: 'みかん'
    }
    values = hash.fetch_values(:apple, :pineapple) { |k| "translation missing: #{k}" }
    assert_equal(['りんご', 'translation missing: pineapple'], values)
  end
end
