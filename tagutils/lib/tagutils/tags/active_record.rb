
module TagDb
  module ClassMacros
    def has_many_tags( opts={} )
      puts "  [TagDb.has_many_tags] adding taggings n tags has_many assocs to model >#{name}<"

      has_many :taggings, class_name: 'TagDb::Model::Tagging', :as      => :taggable
      has_many :tags,     class_name: 'TagDb::Model::Tag',     :through => :taggings

      ### check: use tag_name instead of tag_key ???
      scope :with_tag, ->(tag_key){ joins(:tags).where('tags.key' => tag_key) }
    end
    
    ## same as scope above
    ## def with_tag( tag_key )
    ##  joins(:tags).where( 'tags.key' => tag_key )
    ## end
  end
end




module ActiveRecord
  class Base
    extend TagDb::ClassMacros
  end # class Base
end # module ActiveRecord



####################################################
# todo/check:  use concern - why? why not? e.g
#

=begin
require 'active_support/concern'

module TagUtils::ActiveRecord
  extend ActiveSupport::Concern

  module ClassMethods
    def has_many_tags
      has_many :taggings, class_name: 'TagDb::Model::Tagging', :as => :taggable
      has_many :tags,     class_name: 'TagDb::Model::Tag',     :through => :taggings
    end
  end
end

class ActiveRecord::Base
  include TagUtils::ActiveRecord
end

=end

