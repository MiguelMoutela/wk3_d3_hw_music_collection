require ('PG')

# require_relative('../db/sql_runner.rb')
# require_relative('artists.rb')

class Album

  attr_accessor(:title, :year)
  attr_reader(:id, :artist_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name  = options['name']
    @artist_id = options['artist_id'].to_i()
  end

end
