
## stdlibs
require 'pp'

## 3rd party gems/libs

require 'activerecord'
require 'activerecord/utils'

class Beer < ActiveRecord::Base
  alias_attr :abvii, :abv
  alias_attr_reader :abvread, :abv
  alias_attr_writer :abvwrite, :abv
end


puts 'hello before connect'

db_config = {
  adapter: 'sqlite3',
  database: 'beer.db'
}


ActiveRecord::Base.establish_connection( db_config )

puts 'hello after connect'

pp Beer.first

