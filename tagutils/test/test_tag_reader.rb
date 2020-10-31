# encoding: utf-8

require 'helper'

class TestTagReader < MiniTest::Test

  def setup
    TagDb.delete!
    CategoryDb.delete!

    Movie.delete_all
  end

  def test_read
    include_path = "#{TagUtils.root}/test"

    path = "#{include_path}/tags.1.yml"
    puts "[TestTagReader.test_read] path: #{path}"

    reader = TagDb::TagReader.from_file( path )
    reader.read
  end


end # class TestTagReader
