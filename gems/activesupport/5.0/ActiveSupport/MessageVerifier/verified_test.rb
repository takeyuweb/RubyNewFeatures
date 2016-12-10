require 'test/unit'
require 'active_support/message_verifier'

class TestMessageVerifier < Test::Unit::TestCase

  def test_valid_message?
    original_message = '元のテキスト'
    signed_message = verifier.generate(original_message)
    assert(verifier.valid_message?(signed_message))
  end

  def test_invalid_message
    original_message = '元のテキスト'
    signed_message = verifier.generate(original_message)
    falsified_message = falsify(signed_message)
    assert_false(verifier.valid_message?(falsified_message))
  end

  def test_verified
    original_message = '元のテキスト'
    signed_message = verifier.generate(original_message)
    assert_equal(original_message, verifier.verified(signed_message))
  end

  def test_verified_with_invalid_message
    original_message = '元のテキスト'
    signed_message = verifier.generate(original_message)
    falsified_message = falsify(signed_message)
    assert_nil(verifier.verified(falsified_message))
  end

  def test_verify
    original_message = '元のテキスト'
    signed_message = verifier.generate(original_message)
    assert_equal(verifier.verified(signed_message), verifier.verify(signed_message))
  end

  def test_verify_with_invalid_message
    original_message = '元のテキスト'
    signed_message = verifier.generate(original_message)
    falsified_message = falsify(signed_message)
    assert_raise(ActiveSupport::MessageVerifier::InvalidSignature) do
      verifier.verify(falsified_message)
    end
  end


  private

  def secret
    @secret ||= SecureRandom::hex(128)
  end

  def verifier
    @verifier ||= ActiveSupport::MessageVerifier.new(secret, cipher: 'aes-256-cbc')
  end

  def falsify(signed_message)
    _encoded_body, sign = signed_message.split('--')
    [Base64.strict_encode64('置き換えたメッセージ'), sign].join('--')
  end

end
