require 'test/unit'

class TestNameErrorReceiver < Test::Unit::TestCase
  def test_receiver
    obj = Object.new
    error = nil
    begin
      obj.hoge!
    rescue NameError => e
      error = e
    end

    assert_not_nil(error)
    assert_equal(obj, error.receiver)
    assert_equal(:hoge!, error.name)
  end
end