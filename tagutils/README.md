# tagutils

tagutils gems - tag utilities (tag, taggings, tag list, etc.)

* home  :: [github.com/rubylibs/tagutils](https://github.com/rubylibs/tagutils)
* bugs  :: [github.com/rubylibs/tagutils/issues](https://github.com/rubylibs/tagutils/issues)
* gem   :: [rubygems.org/gems/tagutils](https://rubygems.org/gems/tagutils)
* rdoc  :: [rubydoc.info/gems/tagutils](http://rubydoc.info/gems/tagutils)


## Usage

### Schema / Tables

Use `TagDb.create` to build the `tags` and `taggings` tables
and `CategoryDb.create` to build the `categories` and `categorizations` tables.
Example:

```
# ...
TagDb.create
# ...
CategoryDb.create
# ...
```


### Models

Add the associations yourself with the standard `has_many` class macro:

```
class Movie < ActiveRecord::Base
  # ...
  has_many :taggings, class_name: 'TagDb::Model::Tagging', :as      => :taggable
  has_many :tags,     class_name: 'TagDb::Model::Tag',     :through => :taggings
  # ...
  has_many :categorizations, class_name: 'CategoryDb::Model::Categorizations', :as      => :categorizable
  has_many :categories,      class_name: 'CategoryDb::Model::Category',        :through => :categorizations
  # ...
end
```

or use the built-in class macro shortcuts:

```
class Movie < ActiveRecord::Base
  # ...
  has_many_tags
  # ...
  has_many_categories
  # ...
end
```

The `has_many_tags` also adds the following methods:

```
Movie.with_tag( 'doc' )
# e.g. scope :with_tag, ->(tag_key){ joins(:tags).where('tags.key' => tag_key) }
```

The `has_many_categories` also adds the following methods:

```
Movie.with_category( 'doc' )
# e.g. scope :with_category, ->(category_key){ joins(:categories).where('categories.key' => category_key) }
```

### Reader

The `TagReader` lets you read plain text fixtures (data sets). Example:

```
tags.1.yml:
-----------

# organizations

orgs: un, g5, g8, g20, eu, commonwealth, mercosur, nafta
football: fifa, uefa, afc, ofc, caf, csf, concacaf

# national regions

brasil: s|South, se|Southeast, co|Centerwest, ne|Northeast, n|North
```

To read the tags use:

```
TagReader.new( <include_path>).read( `tags.1` )
```



## Real World Usage

- [worlddb gem](http://rubygems.org/gems/worlddb) - continent, country, region, metro, city, district etc. models
- [winedb gem](http://rubygems.org/gems/winedb) - wine, winery, winemaker, vineyards, etc. models
- [beerdb gem](http://rubygems.org/gems/beerdb) - beer, brand, brewery, etc. models


## License

The `tagutils` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.
