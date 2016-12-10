require 'active_support'
require 'active_support/core_ext'
require 'benchmark'

array_a = (0..10_000).to_a
array_b = (0..1_000).inject([]) { |data, _i| data.push(rand(10_000)) }

class Array
  # https://github.com/rails/rails/blob/a678c47f6d31977e2a91cc198f115c803f0fc8e1/activesupport/lib/active_support/core_ext/enumerable.rb#L72
  # Enumerable#withoutの実装をコピー
  def _without(*elements)
    reject { |element| elements.include?(element) }
  end
end

Benchmark.bm 10 do |r|
  r.report 'Array#without' do
    1_000.times do
      array_a.without(array_b)
    end
  end

  r.report 'Enumerable#without' do
    1_000.times do
      array_a._without(array_b)
    end
  end

  r.report 'Array#reject' do
    1_000.times do
      array_a.reject { |element| array_b.include?(element) }
    end
  end
end
