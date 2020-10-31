

require 'tagutils/categories/schema'
require 'tagutils/categories/models/category'
require 'tagutils/categories/models/category_comp'
require 'tagutils/categories/models/categorization'

require 'tagutils/categories/active_record'   # -- adds has_many_tags, has_many_categories class macros


module CategoryDb
  VERSION = TagUtils::VERSION

  def self.create
    CreateDb.new.up
    ConfDb::Model::Prop.create!( key: 'db.schema.category.version', value: VERSION )
  end

  # delete ALL records (use with care!)
  def self.delete!
    puts '*** deleting category/categorization table records/data...'
    Model::Categorization.delete_all
    Model::Category.delete_all
  end

  def self.tables
    puts "  #{Model::Category.count} categories"
    puts "  #{Model::Categorization.count} categorizations"
  end
end # module CategoryDb

