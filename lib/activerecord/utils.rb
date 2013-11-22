

require 'activerecord/utils/version'  # let it always go first


module ActiveRecord
module Utils

  def self.banner
    "activerecord-utils #{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

=begin
  def self.root
    "#{File.expand_path( File.dirname(File.dirname(__FILE__)) )}"
  end
=end

end  # module Utils
end  # module ActiveRecord


puts ActiveRecord::Utils.banner    # say hello

