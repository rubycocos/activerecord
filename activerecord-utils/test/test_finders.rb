# encoding: utf-8

require 'helper'

class TestFinders < MiniTest::Test


  def test_find_by
    b = Beer.find_by( key: 'ottakringerhelles' )
    assert_equal 'Ottakringer Helles', b.name
    
    b = Beer.find_by( key: 'zwettlerdunkles' )
    assert_equal nil, b
    
    b = Beer.find_by!( key: 'ottakringerhelles' )
    assert_equal 'Ottakringer Helles', b.name

    ## fix/todo: add
    ## raises RecordNotfound 
    ## b = Beer.find_by!( key: 'zwettlerdunkles' )
  end

end # class TestFinders

