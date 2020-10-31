# Tag, Tagging Notes 'n' Tips


- [Tagging -- RailsCasts #382](http://railscasts.com/episodes/382-tagging?view=asciicast) - ASCII Article of Screencast by Ryan Bates

- [Gutentag: Simple Rails Tagging](http://freelancing-gods.com/posts/gutentag_simple_rails_tagging) - Article by Pat Allan

- [Tagging -- Crafting Gems Tutorial](http://railsconftutorials.com/2013/sessions/crafting_gems.html) - Article by Pat Allan


## Alternatives


### Tags

- [gutentag](https://github.com/pat/gutentag)

```
create_table :taggings do |t|
  t.integer    :tag_id,        null: false
  t.integer    :taggable_id,   null: false
  t.string     :taggable_type, null: false
  t.timestamps
end

create_table :tags do |t|
  t.string      :name,           null: false
  t.integer     :taggings_count, null: false, default: 0
  t.timestamps
end
```


- [acts_as_taggable_on](https://github.com/mbleigh/acts-as-taggable-on)

```
create_table :tags do |t|
  t.string  :name
end

create_table :taggings do |t|
  t.references :tag
  t.references :taggable, polymorphic: true
  t.references :tagger,   polymorphic: true
  t.string     :context,  limit: 128
  t.datetime   :created_at
end
```

(Source: [db/migrate/1_acts_as_taggable_on_migration.rb](https://github.com/mbleigh/acts-as-taggable-on/blob/master/db/migrate/1_acts_as_taggable_on_migration.rb))


- [is_taggable](https://github.com/jamesgolick/is_taggable)

```
create_table :tags do |t|
  t.string :name, default: ''
  t.string :kind, default: ''
end

create_table :taggings do |t|
  t.integer :tag_id

  t.string  :taggable_type, default: ''
  t.integer :taggable_id
end
```

(Source: [generators/is_taggable_migration/templates/migration.rb](https://github.com/jamesgolick/is_taggable/blob/master/generators/is_taggable_migration/templates/migration.rb))

- [rocket_tag](https://github.com/bradphelan/rocket_tag)

```
create_table :tags do |t|
  t.string :name
end

create_table :taggings do |t|
  t.references :tag
  t.references :taggable, polymorphic: true
  t.references :tagger,   polymorphic: true
  t.string     :context
  t.datetime   :created_at
end

create_table :alias_tags, :id => false do |t|
  t.integer :tag_id
  t.integer :alias_id
end
```

(Source: [generators/rocket_tag/migration/templates/active_record/migration.rb](https://github.com/bradphelan/rocket_tag/blob/master/lib/generators/rocket_tag/migration/templates/active_record/migration.rb))


- [acts_as_taggable_redux](https://github.com/geemus/acts_as_taggable_redux)

```
create_table :tags do |t|
  t.string  :name
  t.integer :taggings_count,  null: false, default: 0
end

create_table :taggings do |t|
  t.integer :tag_id
  t.integer :taggable_id
  t.string  :taggable_type
  t.integer :user_id
end
```

(Source: [generators/acts_as_taggable_tables/templates/migration.rb](https://github.com/geemus/acts_as_taggable_redux/blob/master/generators/acts_as_taggable_tables/templates/migration.rb))


- [acts_as_taggable_on_steroids](https://github.com/mattetti/acts_as_taggable_on_steroids)

```
create_table :tags do |t|
  t.string :name
end

create_table :taggings do |t|
  t.integer  :tag_id
  t.integer  :taggable_id
  t.string   :taggable_type

  t.datetime :created_at
end
```

(Source: [generators/acts_as_taggable_migration/templates/migration.rb](https://github.com/mattetti/acts_as_taggable_on_steroids/blob/master/generators/acts_as_taggable_migration/templates/migration.rb))


- [Ruby Toolbook - Rails Tagging Category](https://www.ruby-toolbox.com/categories/rails_tagging)


### Categories

- [categoryz3](https://github.com/tscolari/categoryz3)

```
create_table :categoryz3_categories do |t|
  t.string     :name
  t.references :parent
  t.integer    :items_count,       default: 0
  t.integer    :child_items_count, default: 0
  t.integer    :childrens_count,   default: 0
  t.timestamps
end

create_table :categoryz3_items do |t|
  t.references :category,      null: false
  t.references :categorizable, null: false, polymorphic: true
  t.timestamps
end

create_table :categoryz3_child_items do |t|
  t.references :category,      null: false
  t.references :categorizable, null: false, polymorphic: true
  t.references :master_item,   null: false
  t.timestamps
end
```

- [categorizable](https://github.com/boof/categorizable)

```
create_table :categories do |t|
  t.string     :name, null: false
  t.timestamps
end

create_table :categorizations do |t|
  t.references :category,      null: false
  t.references :categorizable, null: false, :polymorphic: true
  t.timestamps
end
```

- [acts_as_category](https://github.com/wuwx/acts_as_category)
