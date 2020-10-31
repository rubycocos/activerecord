
# stdlibs

require 'pp'
require 'yaml'

# 3rd party gems

require 'activerecord-import'  # see https://github.com/zdennis/activerecord-import 

# our own code

require 'activerecord/importer/version'
require 'activerecord/importer/runner'

module ActiveRecord::Importer

  def self.banner
    "activerecord-importer #{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

end


# say hello on load
puts ActiveRecord::Importer.banner
