# encoding: utf-8

module CategoryDb

class CreateDb

  def up
ActiveRecord::Schema.define do

create_table :categories do |t|
  t.string     :key,   null: false
  t.string     :slug,  null: false
  t.string     :name,  null: false
  t.references :parent
  # todo: use only t.datetime :created_at (do we get ar magic? is updated used/needed??)
  t.timestamps
end

add_index :categories, :key, unique: true

create_table :categorizations do |t|
  t.references :category,      null: false, index: false                     ## Note: do NOT auto-add index
  t.references :categorizable, null: false, index: false, polymorphic: true  ## Note: do NOT auto-add index

  # todo: use only t.datetime :created_at (do we get ar magic? is updated used/needed??)
  t.timestamps
end

###
# note: use name prop
#  too avoid error index name too long (e.g. sqlite requires <64 chars)

add_index :categorizations, :category_id, name: 'categorizations_cats_idx'
add_index :categorizations, [:categorizable_id, :categorizable_type], name: 'categorizations_idx'
add_index :categorizations, [:categorizable_id, :categorizable_type, :category_id], unique: true, name: 'categorizations_unique_idx'

end # Schema.define
  end # method up


end  # class CreateDb

end # module CategoryDb
