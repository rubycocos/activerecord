# encoding: utf-8

module TagDb

class CreateDb

  def up
ActiveRecord::Schema.define do

create_table :tags do |t|
  t.string  :key,   null: false
  t.string  :slug,  null: false
  t.string  :name    # todo: make required?  -- note: was title formerly
  t.integer :grade, null: false, default: 1  # grade/tier e.g. 1/2/3 for now - rename to rank why? why not??


  # parent used for hierarchy (e.g. lets you use tag stacks/packs etc.)
  t.references :parent     ## foreign_key: true -- check/todo: add foreign_key, add index: false - why? why not?

  # todo: use only t.datetime :created_at (do we get ar magic? is updated used/needed??)
  t.timestamps
end


add_index :tags, :key,  unique: true

create_table :taggings do |t|
  t.references :tag,      null: false, index: false                     ## Note: do NOT auto-add index
  t.references :taggable, null: false, index: false, polymorphic: true  ## Note: do NOT auto-add index

  # todo: use only t.datetime :created_at (do we get ar magic? is updated used/needed??)
  t.timestamps
end

add_index :taggings, :tag_id  ## note: add index "by hand" in AR5.0 gets auto-added (use index: false!!!)
add_index :taggings, [:taggable_id, :taggable_type]
add_index :taggings, [:taggable_id, :taggable_type, :tag_id], unique: true

end # Schema.define
  end # method up


end  # class CreateDb

end # module TagDb
