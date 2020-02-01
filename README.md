# activerecord-utils

activerecord-utils gem - utilities (e.g. random, alias_attr, etc.) for activerecord in ruby

* home  :: [github.com/rubycoco/activerecord-utils](https://github.com/rubycoco/activerecord-utils)
* bugs  :: [github.com/rubycoco/activerecord-utils/issues](https://github.com/rubycoco/activerecord-utils/issues)
* gem   :: [rubygems.org/gems/activerecord-utils](https://rubygems.org/gems/activerecord-utils)
* rdoc  :: [rubydoc.info/gems/activerecord-utils](http://rubydoc.info/gems/activerecord-utils)

## Usage

### `alias_attr` macro


    alias_attr  :plato, :og         # new, old

generates

    def plato                 # reader
      send( :og )             #  e.g. return og
    end
       
    def plato=(value)         # writer
      send( :'og=', value )   #  e.g. return self.og=value
    end


### `attr_reader_w_fallback` macro

    attr_reader_w_fallbacks :published, :touched

generates

    def published
      #  e.g. read_attribute_w_fallbacks( :published, :touched ) - equals:
      
      value = read_attribute( :published )
      value = read_attribute( :touched )   if value.nil?
      value 
    end


### `rnd` finder

Find random record e.g.:

    beer_of_the_week = Beer.rnd

equals

    beer_of_the_week = Beer.offset( rand( Beer.count ) ).limit(1).first



## Alternatives

### Random

- [`random_record` gem](http://rubygems.org/gems/random_record) - [(Source)](https://github.com/rahult/random_record) returns a random record for Ruby Models using ActiveRecord
- [`activerecord_random` gem](http://rubygems.org/gems/activerecord_random) - [(Source)](https://github.com/GnomesLab/activerecord_random) empowers your ActiveRecord Models with the ability to return a random record without using SQL RAND()
- [`randomizr` gem](http://rubygems.org/gems/randomizr) - Returns one random Active Record object using cross-platform ANSI compliant SQL
- [`fast_random` gem](http://rubygems.org/gems/fast_random) - [(Source)](https://github.com/xdite/fast_random) ultra fast order by rand() solution 
- [`randumb`](https://github.com/spilliton/randumb) - adds ability to pull back random records from Active Record


## License

The scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.
