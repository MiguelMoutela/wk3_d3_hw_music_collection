require('pry')

require_relative('models/artists.rb')
require_relative('models/albums.rb')

Artist.delete_all()
Album.delete_all()

artist_1 = Artist.new({'name' => 'artist'})
artist_2 = Artist.new({'name' => 'another_artist'})
artist_3 = Artist.new({'name' => 'yet_another_artist'})

album_1 = Album.new({'title' => 'that_album'})
album_2 = Album.new({'title' => 'the_other_album'})
album_3 = Album.new({'title' => 'that_other_album'})

binding.pry
nil
