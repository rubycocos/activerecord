# encoding: utf-8

require 'helper'

class TestReaders < MiniTest::Test

  def test_fallbacks

    f = Feed.find_by_key!( 'viennarb' )
    assert_equal nil, f.published
    assert_equal nil, f.read_attribute_w_fallbacks( :published, :touched )

    f = Feed.find_by_key!( 'rubyonrails' )
    assert_equal nil, f.published
    assert_equal nil, f.read_attribute_w_fallbacks( :published, :touched )

  end

end # class TestRandom
