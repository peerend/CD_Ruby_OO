require 'album'

class Artists

  @@all_artists = []

  attr_reader(:artist, :albums)

  def Artists.all
    @@all_artists
  end

  def Artists.clear
    @@all_artists = []
  end

  def save
    @@all_artists << self
  end

  def initialize (artist)
    @artist = artist
    @albums = []
  end

  def Artists.artist_arr
    artist_array = []
    @@all_artists.each do |ind_artist|
      artist_array.push(ind_artist.artist)
    end
    artist_array
  end

  def edit_artist(new_artist)
    @artist = new_artist
  end

  def add_album(album_input)
    new_album = Albums.new(album_input)
    @albums << new_album
  end
end