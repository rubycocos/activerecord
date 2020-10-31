# encoding: utf-8

module TagDb
  module Model

class Tag < ActiveRecord::Base

    has_many :taggings

    ## nb: only allow spaces and underscore inbetween;
    ##  do NOT allow digit as first char for now
    validates :key, format: { with: /#{TAG_KEY_PATTERN}/, message: TAG_KEY_PATTERN_MESSAGE }

    scope :by_key,   -> { order( 'key desc' )  }
    scope :by_name,  -> { order( 'name desc' ) }
    scope :top,      -> { where( 'grade=1' )   }


    before_save :on_before_save

    def on_before_save
      # replace space with dash e.g. north america becomes north_america and so on
      self.slug = key.gsub( ' ', '_' )

      ## if name is empty auto fill w/ key
      self.name = key   if name.blank?
    end

end   # class Tag

  end # module Model

  #####
  # add convenience module alias in plural
  #   e.g. lets you use include TagDb::Models
  Models = Model

end # module TagDb
