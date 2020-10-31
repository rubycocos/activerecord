# encoding: utf-8

module CategoryDb
  module Model

class Category

  ##############################################
  # alias for name (depreciated api calls)

  def title()       name;              end
  def title=(value) self.name = value; end
  
  scope :by_title, -> { order( 'name desc' ) }

end   # class Category


  end # module CategoryDb
end # module Model
