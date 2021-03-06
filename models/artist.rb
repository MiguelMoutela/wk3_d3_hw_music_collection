require ('PG')

require_relative('../db/sql_runner.rb')
require_relative('album.rb')

class Artist

  attr_reader(:id, :name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name  = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name)
          VALUES ($1)
          RETURNING *"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists"
    values = []
    artists = SqlRunner.run(sql, values)
    artists_as_objects = artists.map {|artist| Artist.new(artist)}
    return artist
  end

  def get_albums_by_name
    sql = "SELECT * FROM albums
           WHERE name = $1"
    values = [@name]
    albums_hash = SqlRunner.run(sql, values).map {|album| Album.new(album)}
    return album
  end


  def get_albums_by_id
    sql = "SELECT * FROM albums
          WHERE artist_id = $1"
    values = [@id]
    albums_hash = SqlRunner.run(sql, values).map {|album| Album.new(album)}
    return album
  end

  def update
    sql = "UPDATE artists
          SET (name) = ($1)"
    values = [@name]
    SqlRunner.run(sql, values)
  end


end
