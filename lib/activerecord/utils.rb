

require 'activerecord/utils/version'  # let version always go first


module ActiveRecord

module Utils

  def self.banner
    "activerecord-utils #{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

=begin
  def self.root
    "#{File.expand_path( File.dirname(File.dirname(__FILE__)) )}"
  end
=end
end  # module Utils

end  # module ActiveRecord


########################
# add some methods to ActiveRecord::Base
#
#  - todo: use Concerns ?? why? why not??


class ActiveRecord::Base
  
  ### note:
  ## alias_method will NOT work for activerecord attributes
  ##  - attribute reader/writer will NOT exist on startup
  #  thus, lets add a new alias_attr that will
  #    send message / forward  method call on demand
  #
  # e.g. use like:
  #
  #   alias_attr  :abvii, :abv

  ##
  # todo: add opts={} e.g. lets us add, for example, depreciated: true  ??
  #  - will issue a warning 

  def self.alias_attr_reader( new, old )
    define_method( new ) do
      send( old )
      ### use read_attribute( old ) instead? why? why not??
      #  see http://www.davidverhasselt.com/2011/06/28/5-ways-to-set-attributes-in-activerecord/
    end
    ## todo: check for boolean values - add new? version too ??
  end

  def self.alias_attr_writer( new, old )
    define_method( "#{new}=" ) do |value|
      send( "#{old}=", value )
    end
  end
  
  def self.alias_attr( new, old )
    alias_attr_reader( new, old )
    alias_attr_writer( new, old )
  end

  ###################
  #
  #
  # e.g. use like:
  #
  # def published
  #  read_attribute_w_fallbacks( :published, :touched )
  # end
  #
  # or use macro e.g.
  #
  #  attr_reader_w_fallbacks :published, :touched


  def self.attr_reader_w_fallbacks( *keys )
    define_method( keys[0] ) do
      read_attribute_w_fallbacks( keys )
    end
  end

  def read_attribute_w_fallbacks( *keys )
    ### todo: use a different name e.g.:
    ## read_attribute_cascade ?? - does anything like this exists already?
    ## why? why not?
    keys.each do |key|
      value = read_attribute( key )
      return value unless value.nil?
    end
    value # fallthrough? return latest value (will be nil) --or return just nil - why? why not??
  end


  ###############
  # random
  #
  #
  #  e.g. use like:
  #
  #   beer_of_the_week = Beer.rnd
  

  def self.rnd
    ## works w/ sqlite3 and postgresql
    ##  - check if it works w/ mysql/mariadb too ? suppots offset and limit in SQL?

    ## todo: use ::rand  -- and lets add an self.rand alias too ??
    ##  check if ::rand call works
    rnd_offset = rand( self.count ) ## NB: call "global" std lib rand

    self.offset( rnd_offset ).limit( 1 ).first
  end


end # class ActiveRecord::Base



puts ActiveRecord::Utils.banner    # say hello

