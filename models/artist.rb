require ('PG')

# require_relative('../db/sql_runner.rb')
# require_relative('album.rb')

class Artist

  attr_reader(:id, :name)

  def initialize
    @id = options['id'].to_i if options['id']
    @name  = options['name']
  end

end