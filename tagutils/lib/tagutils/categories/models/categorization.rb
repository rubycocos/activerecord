# encoding: utf-8

module CategoryDb
  module Model


class Categorization < ActiveRecord::Base

  belongs_to :category
  belongs_to :categorizable, :polymorphic => true

  ## validates :category,      presence: true
  ## validates :categorizable, presence: true

end   # class Categorization


  end # module CategoryDb
end # module Model
