class Albums
  @@all_albums

  attr_reader(:album)

  def initialize(album)
    @album = album
  end

  def Albums.clear
    @@all_albums = []
  end

  def Albums.all
    @@all_albums
  end

  def save 
    @@all_albums <<self
  end

  def Albums.album_arr
    album_array = []
    @@all_albums.each do |ind_album|
      album_array.push(ind_album.album)
    end
    album_array
  end
end