# encoding: utf-8

module TagDb
  module Model

class Tag

  ##################################################
  # alias for name (depreciated api calls)

  def title()       name;              end
  def title=(value) self.name = value; end

  scope :by_title,  -> { order( 'name desc' ) }

end   # class Tag


  end # module TagDb
end # module Model
