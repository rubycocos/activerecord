# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_browser.rb
#  or better
#     rake test


require 'helper'

class TestBrowser < MiniTest::Test

  DB_CONFIG = {
    adapter:  'sqlite3',
    database: ':memory:'
  }

  def test_connect
    
    browser = ActiveRecordUtils::Browser.new

    ## Note: every connect will create a new empty in memory db
    ##   check - is it possible to reconnect to in memory db??
    ##  use (try) key instead of connection-spec ??

    con = browser.connection_for( DB_CONFIG )
    tables = con.tables
    
    pp tables

    assert true   # for now if get here; assume it's working so far
  end

end # class TestBrowser

