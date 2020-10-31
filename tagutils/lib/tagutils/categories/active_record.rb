
module CategoryDb
  module ClassMacros
    def has_many_categories( opts={} )
      puts "  [CategoryDb.has_many_categories] adding categorizations n category has_many assocs to model >#{name}<"

      has_many :categorizations, class_name: 'CategoryDb::Model::Categorization', :as      => :categorizable
      has_many :categories,      class_name: 'CategoryDb::Model::Category',       :through => :categorizations

      ### check: use category_name instead of category_key  ???
      scope :with_category, ->(category_key){ joins(:categories).where('categories.key' => category_key) }
    end

    ## same as scope above
    ## def with_category( category_key )
    ##  joins(:categories).where( 'categories.key' => category_key )
    ## end
  end
end


module ActiveRecord
  class Base
    extend CategoryDb::ClassMacros
  end # class Base
end # module ActiveRecord

