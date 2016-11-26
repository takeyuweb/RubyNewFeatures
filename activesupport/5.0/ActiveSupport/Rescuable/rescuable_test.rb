require 'test/unit'
require 'active_support'
require 'active_support/rescuable'

class Hoge
  include ActiveSupport::Rescuable
  attr_reader :rescued

  class RescueableError < StandardError;
  end
  class UnrescueableError < StandardError;
  end

  rescue_from RescueableError do
    @rescued = true
  end

  def initialize
    @rescued = false
  end

  def without_error_handling
    raise RescueableError
  end

  def with_error_handling
    raise RescueableError
  rescue => e
    if rescue_with_handler(e)
      :subject
    else
      :not_subject
    end
  end

  def not_subject_to_error_handling
    raise UnrescueableError
  rescue => e
    if rescue_with_handler(e)
      :subject
    else
      :not_subject
    end
  end

end

class TestRescuable < Test::Unit::TestCase

  def test_without_error_handling
    hoge = Hoge.new
    # 自動的に rescue_from が実行されるものではない
    assert_raise(Hoge::RescueableError) { hoge.without_error_handling }
    assert_false(hoge.rescued)
  end

  def test_with_error_handling
    hoge = Hoge.new
    # 例外を resque し、rescue_with_handler(e) に渡すと、指定したエラーなら真を返す
    assert_equal(:subject, hoge.with_error_handling)
    assert(hoge.rescued)
  end

  def test_not_subject_to_error_handling
    hoge = Hoge.new
    # 例外を resque し、rescue_with_handler(e) に渡すと、指定したエラーでないなら偽を返す
    assert_equal(:not_subject, hoge.not_subject_to_error_handling)
    assert_false(hoge.rescued)
  end

end
