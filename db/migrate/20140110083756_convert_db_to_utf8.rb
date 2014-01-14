class ConvertDbToUtf8 < ActiveRecord::Migration
  def up
  	db_config = ActiveRecord::Base.connection.instance_values["config"]
    db_name = db_config[:clexane_development]
    db_user = db_config[:root]
    db_pass = db_config[:Rubh1975] || ''
    db_host = db_config[:localhost]
    
    latin1_dump = 'latin1_dump.sql'
    utf8_dump   = 'utf8_dump.sql'
    
 
    print "Again Dumping database... "
    system "mysqldump --user=#{db_user} --password='#{db_pass}' --host='#{db_host}' --add-drop-table --default-character-set=latin1 --insert-ignore --skip-set-charset #{db_name} > #{latin1_dump}"
    puts "done"
    
    print "Converting dump to UTF8... "    
    system "iconv -f ISO-8859-1 -t UTF-8 #{latin1_dump} | sed 's/latin1/utf8/' > #{utf8_dump}"
    puts "done"
    
    print "Recreating database..."
    system "mysql --user=#{db_user} --password='#{db_pass}' --host='#{db_host}' --execute=\"DROP DATABASE #{db_name};\""
    system "mysql --user=#{db_user} --password='#{db_pass}' --host='#{db_host}' --execute=\"CREATE DATABASE #{db_name} CHARACTER SET utf8 COLLATE utf8_unicode_ci;\""
    puts "done"
    
    print "Importing UTF8 dump..."
    system "mysql --user=#{db_user} --password='#{db_pass}' --host='#{db_host}' --default-character-set=utf8 #{db_name} < #{utf8_dump}"
    puts "done"
 
    puts " *** don't forget to delete temp files #{latin1_dump} and #{utf8_dump}"
  end

  def down
  	raise "cant revert sorry"
  end
end
