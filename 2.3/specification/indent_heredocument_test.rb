require 'test/unit'

class TestIndentHereDocument < Test::Unit::TestCase
  def test_here_document
    text = <<HERE
    ABCEDFG
    HIJKLMN
HERE
    assert_equal(text, "    ABCEDFG\n    HIJKLMN\n")
  end

  def test_whitespace_indent_here_document
    text = <<~HERE
    ABCEDFG
    HIJKLMN
HERE
    assert_equal(text, "ABCEDFG\nHIJKLMN\n")
  end

  def test_tab_indent_here_document
    text = <<~HERE
    ABCEDFG
    HIJKLMN
HERE
    assert_equal(text, "ABCEDFG\nHIJKLMN\n")
  end
end
