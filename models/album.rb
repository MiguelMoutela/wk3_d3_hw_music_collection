require ('PG')

require_relative('../db/sql_runner.rb')
require_relative('artist.rb')

class Album

  attr_accessor(:title, :year, :genre)
  attr_reader(:id, :artist_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title  = options['title']
    @year = options['year']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i()
  end

  def save()
    sql = "INSERT INTO albums (title, year, genre)
          VALUES ($1, $2, $3)
          RETURNING *"
    values = [@title, @year, @genre]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists"
    values = []
    albums = SqlRunner.run(sql, values)
    albums_as_objects = albums.map {|album| Artist.new(album)}
    return album
  end

  def get_artist
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [artist_id]
    result = SqlRunner.run(sql, values)
    artist_data = result[0]
    artist = Artist.new(artist_data)
    return artist
  end

  def update
    sql = "UPDATE albums
          SET (title, year, genre) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@title, @year, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)
  end
end
