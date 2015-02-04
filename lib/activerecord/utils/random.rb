# encoding: utf-8

module ActiveRecord
class Base
  
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


end # class Base
end # module ActiveRecord
