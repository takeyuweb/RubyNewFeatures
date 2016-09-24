require 'benchmark'

array = (0 .. 100000).to_a

Benchmark.bm 10 do |r|
  r.report 'find' do
    1000.times do
      array.find { |x| x > rand(100000) }
    end
  end
  r.report 'bsearch' do
    1000.times do
      array.bsearch { |x| rand(100000) }
    end
  end
end
