require 'csv'
require 'test/unit'

class TestCsvLiberalParsing < Test::Unit::TestCase

  def test_without_liberal_parsing
    assert_nothing_raised(CSV::MalformedCSVError) do
      CSV.parse_line(valid_csv_line)
    end

    assert_raise(CSV::MalformedCSVError) do
      CSV.parse_line(malformed_csv_line)
    end
  end

  def test_with_liberal_parsing
    assert_nothing_raised(CSV::MalformedCSVError) do
      CSV.parse_line(malformed_csv_line, liberal_parsing: true)
    end

    data = CSV.parse_line(malformed_csv_line, liberal_parsing: true)
    assert_equal(['AAAAA', 'B"BBB"B', 'CCCCC'], data)
  end

  private
  def malformed_csv_line
    # 「"」を含むフィールドは「"」で囲んだ上で、
    # フィールド内の「"」は前にもう１つ「"」を付けてエスケープする必要がある
    '"AAAAA",B"BBB"B,CCCCC'
  end

  def valid_csv_line
    '"AAAAA","B""BBB""B",CCCCC'
  end

end