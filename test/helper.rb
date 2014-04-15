
## $:.unshift(File.dirname(__FILE__))

## minitest setup

# require 'minitest/unit'
require 'minitest/autorun'

# include MiniTest::Unit  # lets us use TestCase instead of MiniTest::Unit::TestCase


# ruby stdlibs

require 'json'
require 'uri'
require 'pp'
require 'logger'

# ruby gems

require 'active_record'

require 'logutils'
require 'logutils/db'   # NB: explict require required for LogDb (not automatic) 


# our own code

require 'activerecord/utils'


class Beer < ActiveRecord::Base
  alias_attr :abvii, :abv
  alias_attr_reader :abvread, :abv
  alias_attr_writer :abvwrite, :abv
end



class CreateBeerDb
  
  def up
    ActiveRecord::Schema.define do

    create_table :beers do |t|
      t.string  :key,   null: false
      t.string  :name,  null: false

      t.string  :web    # optional url link (e.g. )
      t.integer :since  # optional year (e.g. 1896)

      t.decimal    :abv    # Alcohol by volume (abbreviated as ABV, abv, or alc/vol) e.g. 4.9 %
      t.decimal    :og     # malt extract (original gravity) in plato

      t.timestamps
    end 
    end # Schema.define
  end # method up

end  # class CreateMovieDb



def setup_in_memory_db
  # Database Setup & Config

  db_config = {
    adapter:  'sqlite3',
    database: ':memory:'
  }

  pp db_config

  ActiveRecord::Base.logger = Logger.new( STDOUT )
  ## ActiveRecord::Base.colorize_logging = false  - no longer exists - check new api/config setting?

  ## NB: every connect will create a new empty in memory db
  ActiveRecord::Base.establish_connection( db_config )


  ## build schema
  LogDb.create
  CreateBeerDb.new.up
  
  Beer.create!( key: 'ottakringerhelles', name: 'Ottakringer Helles' )
  Beer.create!( key: 'ottakringerzwicklrot', name: 'Ottakringer Zwickl Rot' )
end


setup_in_memory_db()
