require 'benchmark'

array = (0 .. 100000).to_a

Benchmark.bm 10 do |r|
  r.report 'index' do
    1000.times do
      array.index { |x| x > rand(100000) }
    end
  end
  r.report 'bsearch_index' do
    1000.times do
      array.bsearch_index { |x| rand(100000) }
    end
  end
end
