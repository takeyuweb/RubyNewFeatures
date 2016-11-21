require 'test/unit'
require 'active_support'
require 'active_support/core_ext/securerandom'

class TestSecureRandomBase58 < Test::Unit::TestCase

  def test_base58
    assert_instance_of(String, SecureRandom.base58) # "SYTqUBA1e6vZ5kxn"
    assert_instance_of(String, SecureRandom.base58(10)) # "ae9NBz9D57"
  end

end