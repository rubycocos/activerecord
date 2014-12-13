# encoding: utf-8

require 'helper'

class TestRandom < MiniTest::Test

  def test_rnd
    b = Beer.rnd
    assert_equal false, b.name.blank?
    assert_equal false, b.key.blank?

    ## try another
    b = Beer.rnd
    assert_equal false, b.name.blank?
    assert_equal false, b.key.blank?
  end

end # class TestRandom
