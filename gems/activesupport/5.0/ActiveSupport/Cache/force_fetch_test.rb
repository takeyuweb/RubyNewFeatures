require 'test/unit'
require 'active_support'

class TestActiveSupportCacheFetch < Test::Unit::TestCase

  def test_fetch_without_force
    cache.write('name', 'Apple')
    assert_equal('Apple', cache.fetch('name'))
    assert_equal('Apple', cache.fetch('name') { 'Orange' })
    assert_equal('Apple', cache.fetch('name'))
  end

  if ActiveSupport::VERSION::MAJOR > 4

    # ActiveSupport 5.0 からは
    # cache.fetch(key, force: true) でブロックがない場合NameError
    def test_fetch_with_force_5_0
      cache.write('name', 'Apple')
      assert_raise(ArgumentError) { cache.fetch('name', force: true) }
      assert_equal('Orange', cache.fetch('name', force: true) { 'Orange' })
      assert_equal('Orange', cache.fetch('name'))
    end

  else

    # ActiveSupport 4.2 までは
    # cache.fetch(key, force: true) でブロックがない場合キャッシュされた値が返る
    def test_fetch_with_force_4_2
      cache.write('name', 'Apple')
      assert_equal('Apple', cache.fetch('name', force: true))
      assert_equal('Orange', cache.fetch('name', force: true) { 'Orange' })
      assert_equal('Orange', cache.fetch('name'))
    end


  end

  private def cache
    @cache ||= ActiveSupport::Cache::MemoryStore.new
  end

end

