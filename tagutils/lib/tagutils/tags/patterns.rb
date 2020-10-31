# encoding: utf-8

module TagDb

# collection of regex patterns for reuse (TagDb specific)

### todo: add a patterns.md page to  github ??
##  - add regexper pics??

############
# about ruby regexps
#
# try the rubular - Ruby regular expression editor and tester
#  -> http://rubular.com
#   code -> ??  by ??
#
#
# Jeff Avallone's Regexper - Shows State-Automata Diagrams
#  try -> http://regexper.com
#    code -> https://github.com/javallone/regexper
#
#
#  Regular Expressions | The Bastards Book of Ruby by Dan Nguyen
# http://ruby.bastardsbook.com/chapters/regexes/
#
# move to notes  regex|patterns on  geraldb.github.io ??
#


  ## nb: only allow spaces and underscore inbetween;
  ##  do NOT allow digit as first char for now
  TAG_KEY_PATTERN = '\A(?:[a-z]|[a-z][a-z0-9_ ]*[a-z0-9])\z'
  TAG_KEY_PATTERN_MESSAGE = "expected one or more lowercase letters a-z or 0-9 digits or space or underscore /#{TAG_KEY_PATTERN}/"


end # module TagDb

