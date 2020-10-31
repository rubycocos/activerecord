
# 3rd party gems / libs

require 'active_record'   ## todo: add sqlite3? etc.

require 'props'
require 'logutils'
require 'textutils'


# our own code

require 'tagutils/version'  # let it always go first

require 'tagutils/tags'
require 'tagutils/categories'



####
# use shared/common module/namespace ?
#   e.g.
#   - ClassificationDb, ClassiDb ??
#   - TaxonomyDb, TaxonDb, TaxyDb ??? 
#   - TopicDb, KeywordDb ??  --  why? why not??

module TagUtils

  def self.banner
    "tagutils/#{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

  def self.root
    "#{File.expand_path( File.dirname(File.dirname(__FILE__)) )}"
  end

end  # module TagUtils


# say hello
puts TagUtils.banner    if $DEBUG || (defined?($RUBYLIBS_DEBUG) && $RUBYLIBS_DEBUG)
