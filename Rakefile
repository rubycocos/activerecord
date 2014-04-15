require 'hoe'
require './lib/activerecord/utils/version.rb'

Hoe.spec 'activerecord-utils' do

  self.version = ActiveRecord::Utils::VERSION

  self.summary = 'activerecord-utils - utilities (e.g. random, alias_attr, etc.) for activerecord'
  self.description = summary

  self.urls    = ['https://github.com/rubylibs/activerecord-utils']

  self.author  = 'Gerald Bauer'
  self.email   = 'webslideshow@googlegroups.com'

  # switch extension to .markdown for gihub formatting
  self.readme_file  = 'README.md'
  self.history_file = 'History.md'

  self.extra_deps = [
    ['logutils']
  ]

  self.licenses = ['Public Domain']

  self.spec_extras = {
   required_ruby_version: '>= 1.9.2'
  }


end