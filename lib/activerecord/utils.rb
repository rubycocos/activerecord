
require 'activerecord/utils/version'  # let version always go first


module ActiveRecord

module Utils

  def self.banner
    ## add ar PRE too? how?
    ar = "activerecord/#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}.#{ActiveRecord::VERSION::TINY}"
    "activerecord-utils/#{VERSION} (#{ar}) on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

  def self.root
    ## fix/todo: check if another File.dirname level required!!!! - activerecord/utils
    "#{File.expand_path( File.dirname(File.dirname(__FILE__)) )}"
  end

end  # module Utils

end  # module ActiveRecord


########################
# add some methods to ActiveRecord::Base
#  - todo: use Concerns ?? why? why not??

if ActiveRecord::VERSION::MAJOR == 3   # only add to 3.x series
  require 'activerecord/utils/comp3'
end

require 'activerecord/utils/alias'
require 'activerecord/utils/random'


puts ActiveRecord::Utils.banner    # say hello

