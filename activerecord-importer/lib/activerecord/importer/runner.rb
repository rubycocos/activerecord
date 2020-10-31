

module ActiveRecord::Importer

  class Runner

    def initialize( db_config_path = 'database.yml',
                    db_source_key = 'source',
                    db_dest_key = 'dest',
                    db_props_table_name = 'props' )

      @db_config = YAML.load_file( db_config_path )

      @db_source = @db_config[ db_source_key ]
      @db_dest   = @db_config[ db_dest_key   ]
      
      puts "datasource old:"
      pp @db_source

      puts "datasource new:"
      pp @db_dest

      # lets use a props model for tracking versions/imports
      @prop_klass = Class.new( ActiveRecord::Base )   # same as  class Anoynymous < ActiveRecord::Base ; end
      @prop_klass.table_name = db_props_table_name     # same as   self.table_name = 'new_table_name'
    end

    ## todo: use connect_old! w/ !!! - check ar for convetion
    def connect_old
      ActiveRecord::Base.establish_connection( @db_source )
    end

    def connect_new
      ActiveRecord::Base.establish_connection(  @db_dest )
    end

    def connect( key )
      ActiveRecord::Base.establish_connection(  @db_config[ key ] )
    end


    def import( items )

      ## todo: track start/stop time
    
      items.each_with_index do |item,index|
        puts "Importing step #{index+1}/#{items.size}..."

        model_klass = item[0]

        if item.size > 2  # assume source is array (cols ary,recs ary)
          cols = item[1]
          recs = item[2]
          import_table_from_ary( model_klass, cols, recs )
        else         # assume source is sql (string)
          sql  = item[1]
          import_table_from_sql( model_klass, sql )
        end
      end

      version = version_string()

      print "Adding version string >#{version}<..."
      @prop_klass.create!( :key => 'db.version.import', :value => version )
      puts 'OK'
    end


   def import_table_from_ary( model_klass, cols, recs )

     print "Found #{recs.size} records; "

     connect_new()

     print "adding to table >#{model_klass.name}<"

     objs = []
     
     recs.each_with_index do |rec,i|
       obj = model_klass.new
       cols.each_with_index do |col,index|
         ## nb: use setters; lets us use obj.id = 42 e.g. mass assignment ignores/protects ids
         obj.send( "#{col}=", rec[index] )
       end
       objs << obj
       ## obj.save!
              
       print_progress(i)  # keep user entertained ...o....O...
     end
    
    ## lets use batch inserts thanks to activerecord-importer gem (see https://github.com/zdennis/activerecord-import)
    model_klass.import( objs )
     
    puts 'OK'
   end # method import_table_from_ary


   def import_table_from_sql( model_klass, sql )

      connect_old()

      print "Fetching records with query >#{sql}<..."
  
      recs = ActiveRecord::Base.connection.execute( sql )

      puts 'OK'
      print "Found #{recs.length} records; "

      connect_new()

      print "adding records to table >#{model_klass.name}<"

      objs = []
      
      recs.each_with_index do |rec,i|
        #debug_dump_record( rec )
        objs << model_klass.new( downcase_hash( rec ) )

        print_progress(i)  # keep user entertained ...o....O...
      end

      ## lets use batch inserts thanks to activerecord-importer gem (see https://github.com/zdennis/activerecord-import)
      model_klass.import( objs )
      
      puts 'OK'
    end


def debug_dump_table( sql )
  
  print "Connecting..."
  connect_old()
  puts  'OK'
  puts  'Connection successfully established.'

  print "Fetch records with query >#{sql}<..."

  recs = ActiveRecord::Base.connection.execute( sql )

  puts 'OK'
  puts "Found #{recs.length} records."


  recs.each do |rec|
    print '.'
    debug_dump_record( rec )
  end

  puts 'OK'
end


private


def print_progress( i )
  # entertain use on console .....o....o...1000.. etc.
  if ((i+1) % 1000) == 0
    print (i+1)
  elsif ((i+1) % 100) == 0
    print 'O'
  elsif ((i+1) % 10) == 0
    print 'o'
  else
    print '.'
  end

  print "\r\n" if ((i+1) % 80) == 0   # add new line after 80 records
end


def version_string
  
  username     = ENV['USERNAME']     || '!!(username missing)'
  computername = ENV['COMPUTERNAME'] || '!!(computername missing)'
  
  buf = ""
  buf << "generated on #{Time.now} "
  buf << "by #{username} @ #{computername} " 
  buf << "using Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  buf
end

def downcase_hash( hash )
  new_hash = {}
  hash.each do |k,v|
    # hack:  remove rownum key (only internal use; used only for paging)
    next if k.downcase.to_s == 'rownum'

    if v.class == String
      new_hash[ k.downcase ] = v.rstrip # remove trailing spaces (added by cobol in db2!!!)
    else
      new_hash[ k.downcase ] = v
    end
  end
  new_hash
end

def debug_dump_record( hash )
  hash.each do |k,v|
    puts "#{k} => >#{v}< : #{v.class}"
  end
end

  end # class Runner

end # module ActiveRecord::Importer
