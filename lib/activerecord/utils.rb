# encoding: utf-8


require 'activerecord/utils/version'  # let version always go first


module ActiveRecordUtils

  def self.banner
    ## add ar PRE too? how?
    ar = "activerecord/#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}.#{ActiveRecord::VERSION::TINY}"
    "activerecord-utils/#{VERSION} (#{ar}) on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

  def self.root
    "#{File.expand_path( File.dirname(File.dirname(File.dirname(__FILE__))) )}"
  end

end  # module ActiveRecordUtils


########################
# add some methods to ActiveRecord::Base
#  - todo: use Concerns ?? why? why not??

if ActiveRecord::VERSION::MAJOR == 3   # only add to 3.x series
  require 'activerecord/utils/comp3'
end

require 'activerecord/utils/alias'
require 'activerecord/utils/random'
require 'activerecord/utils/browser'


# say hello
puts ActiveRecordUtils.banner    if $DEBUG || (defined?($RUBYLIBS_DEBUG) && $RUBYLIBS_DEBUG)  

### puts "root: >#{ActiveRecordUtils.root}<"   # check root path (remove later)

