require 'hoe'
require './lib/activerecord/utils/version.rb'

Hoe.spec 'activerecord-utils' do

  self.version = ActiveRecordUtils::VERSION

  self.summary = 'activerecord-utils - utilities (e.g. random, alias_attr, etc.) for activerecord'
  self.description = summary

  self.urls    = ['https://github.com/rubycoco/activerecord-utils']

  self.author  = 'Gerald Bauer'
  self.email   = 'wwwmake@googlegroups.com'

  # switch extension to .markdown for gihub formatting
  self.readme_file  = 'README.md'
  self.history_file = 'CHANGELOG.md'

  self.extra_deps = [
    ['logutils'],
    ['activerecord']
  ]

  self.licenses = ['Public Domain']

  self.spec_extras = {
   required_ruby_version: '>= 2.2.2'
  }


end
