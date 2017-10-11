require('pry')

require_relative('./models/artist.rb')
require_relative('./models/album.rb')

# Artist.delete_all()
# Album.delete_all()

artist_1 = Artist.new({'name' => 'artist'})
artist_2 = Artist.new({'name' => 'another_artist'})
artist_3 = Artist.new({'name' => 'yet_another_artist'})

album_1 = Album.new({
  'title' => 'that_album',
  'year' => '2017',
  'genre' => "any_genre",
  'artist_id' => artist_1.id
})

album_2 = Album.new({
  'title' => 'that_album',
  'year' => '2017',
  'genre' => "any_genre",
  'artist_id' => artist_2.id
})

album_3 = Album.new({
  'title' => 'that_album',
  'year' => '2017',
  'genre' => "any_genre",
  'artist_id' => artist_3.id
})

binding.pry()
nil
