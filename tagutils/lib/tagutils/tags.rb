

require 'tagutils/tags/schema'
require 'tagutils/tags/patterns'
require 'tagutils/tags/models/tag'
require 'tagutils/tags/models/tag_comp'
require 'tagutils/tags/models/tagging'

require 'tagutils/tags/active_record'   # -- adds has_many_tags, has_many_categories class macros
require 'tagutils/tags/readers/tag'



module TagDb
  VERSION = TagUtils::VERSION

  def self.create
    CreateDb.new.up
    ConfDb::Model::Prop.create!( key: 'db.schema.tag.version', value: VERSION )
  end

  # delete ALL records (use with care!)
  def self.delete!
    puts '*** deleting tag/tagging table records/data...'
    Model::Tagging.delete_all
    Model::Tag.delete_all
  end

  def self.tables
    puts "  #{Model::Tag.count} tags"
    puts "  #{Model::Tagging.count} taggings"
  end

end # module TagDb

