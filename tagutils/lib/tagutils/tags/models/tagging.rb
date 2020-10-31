# encoding: utf-8

module TagDb
  module Model


class Tagging < ActiveRecord::Base

  belongs_to :tag
  belongs_to :taggable, :polymorphic => true

  ## validates :tag,      presence: true
  ## validates :taggable, presence: true

end   # class Tagging


  end # module TagDb
end # module Model
