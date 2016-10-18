require 'test/unit'

class TestKernelClone < Test::Unit::TestCase

  def test_clone
    # cloneは凍結状態をコピーするので
    # 凍結されたオブジェクトをcloneしたオブジェクトも凍結
    assert(frozen_obj.clone.frozen?)
  end

  def test_clone_with_option
    # freeze: false キーワード引数を渡すと凍結状態をコピーしない
    assert_false(frozen_obj.clone(freeze: false).frozen?)
  end

  private def frozen_obj
    Object.new.tap { |obj| obj.freeze }
  end

end