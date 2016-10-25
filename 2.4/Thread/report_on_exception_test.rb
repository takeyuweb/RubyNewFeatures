require 'test/unit'

class TestThreadReportOnException < Test::Unit::TestCase

  def test_without_report_on_exception
    Thread.report_on_exception = false # デフォルト
    report = capture do
      run_thread
      sleep 0.2
    end
    assert_empty(report)
  end

  def test_with_report_on_exception
    # Thread.report_on_exception = true にすると
    Thread.report_on_exception = true
    report = capture do
      run_thread
      sleep 0.2
    end
    # 以下のようなかたちで標準エラー出力に対してエラー内容が報告される
    # <Thread:0x007fffef3f3468@Thread/report_on_exception_test.rb:45 run> terminated with exception:
    # Thread/report_on_exception_test.rb:50:in `block (2 levels) in
    # test_with_instrance_report_on_exception': exception (RuntimeError)
    assert_not_empty(report)
    assert_match('terminated with exception:', report)
    assert_match('RuntimeError', report)
  end

  def test_with_report_on_exception_with_join
    Thread.report_on_exception = true
    report = capture do
      t = run_thread
      sleep 0.2
      # Thread#joinした場合メインスレッドでも同じ例外が発生しますが
      assert_raise(RuntimeError) { t.join }
    end
    # エラー内容の報告も生きてます
    assert_not_empty(report)
  end

  def test_with_instrance_report_on_exception
    # メインスレッドは Thread.report_on_exception = false だが･･･
    Thread.report_on_exception = false
    report = capture do
      Thread.new do
        # 実行中のスレッドの Thread#report_on_exception = true としていれば･･･
        Thread.current.report_on_exception = true
        Thread.pass
        sleep 0.1
        raise 'exception'
      end
      sleep 0.2
    end
    # エラー内容を報告してくれる
    assert_not_empty(report)
    assert_match('terminated with exception:', report)
    assert_match('RuntimeError', report)
  end

  private
  def run_thread
    Thread.new do
      Thread.pass
      sleep 0.1
      raise 'exception'
    end
  end

  def capture(&block)
    io = StringIO.new
    #$stderr = io
    block.call
    io.string
  ensure
    $stderr = STDERR
  end

end