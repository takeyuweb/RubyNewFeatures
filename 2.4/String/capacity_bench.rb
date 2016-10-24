# frozen_string_literal: true
require 'benchmark'
M = 1_000_000
N = 1_000

some_string = 'a' * N

Benchmark.bm 5 do |r|
  r.report 'without capacity' do
    buf = String.new
    M.times { buf << some_string }
  end

  r.report 'with capacity' do
    # 長い文字列が追加されることがわかっているのではじめから大きく取る
    buf = String.new(capacity: M * N)
    M.times { buf << some_string }
  end

  r.report 'with capacity (short)' do
    # 不足するとエラー、というわけではない
    buf = String.new(capacity: 100)
    M.times { buf << some_string }
  end

end