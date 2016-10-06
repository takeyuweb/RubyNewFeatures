require 'test/unit'
require 'etc'

class TestEtc < Test::Unit::TestCase

  def test_uname
    uname = Etc.uname
    assert_instance_of(Hash, uname)
    assert_not_nil(uname[:sysname])   # "Windows_NT"
    assert_not_nil(uname[:nodename])  # "6.2.9200"
    assert_not_nil(uname[:release])   # "Windows_NT Version 6.2.9200: "
    assert_not_nil(uname[:version])   # "YUICHI-VAIOZ"
    assert_not_nil(uname[:machine])   # "x64"
  end

end