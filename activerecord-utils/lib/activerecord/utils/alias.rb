# encoding: utf-8

module ActiveRecord
class Base
  
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
    value = nil
    keys.each do |key|
      value = read_attribute( key )
      break unless value.nil?  # if value.nil? == false
    end
    value # fallthrough -- return latest value (will be nil)
  end

end # class Base
end # module ActiveRecord
