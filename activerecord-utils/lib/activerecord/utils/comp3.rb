# encoding: utf-8

module ActiveRecord
class Base

    ###
    # todo/fix:
    #  better check if responds_to? find_by! and find_by ???
    puts "  [ActiveRecord::Utils] adding find_by n find_by! finders for 3.x series"

    ## lets us use ActiveRecord 4-style find_by and find_by! in ActiveRecord 3.x  
    def self.find_by( hash )
      self.where( hash ).first
    end
    
    def self.find_by!( hash )
      self.where( hash ).first!     ## or use: first or raise RecordNotFound  directly??
    end

end # class Base
end # module ActiveRecord
