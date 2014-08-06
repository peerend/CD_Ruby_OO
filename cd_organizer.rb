require './lib/artist'
require './lib/album'

def main_menu
  loop do
    puts "Press 'l' to list current artists"
    puts "Press 'n' to add a new CD with album and artist"
    puts "Press 's' to search artist and display albums"
    puts "Press 'a' to list albums for artist"
    puts "Press 'albums' to list all albums"
    puts "press 'add' to add an album to existing artist"
    puts "Press 'c' to edit an artist"
    puts "Press 'x' to exit"

    user_select = gets.chomp.downcase
    if user_select == 'n'
      add_CD
    elsif user_select == 'l'
      list_artists
    elsif user_select == 'a'
      list_albums
    elsif user_select =='albums'
      list_all_albums
    elsif user_select == 's'
      search_artist
    elsif user_select == 'add'
      add_album
    elsif user_select == 'c'
      edit_artist
    elsif user_select == 'x'
      exit
    else
      puts "Please enter a valid option"
    end
  end
end

def add_CD
  puts "Enter Artist"
  artist_input = gets.chomp.to_s
  puts "Enter Album"
  album_input = gets.chomp.to_s
  new_artist = Artists.new(artist_input)
  new_artist.save
  new_artist.add_album(album_input)
end

def add_album
  list_artists
  puts "Enter Artist for which to add album"
  display_choice = gets.chomp.to_i
  selected_artist = Artists.all[display_choice]
  puts "Enter album to add for selected artist"
  new_album = gets.chomp.to_s
  selected_artist.add_album(new_album)
end

def list_all_albums
  puts "Album Collection: "
  album_array = []
  Artists.all.each do |ind_artist|
    ind_artist.albums.each do |cd|
      album_array << cd.album
      puts cd.album
    end
  end
end

def list_artists
  puts "Artist Collection:"
  Artists.all.each_with_index do |specific_artist, index|
    puts index.to_s + ' ' + specific_artist.artist.to_s
  end
end

def list_albums
  list_artists
  puts "Select Artist:"
  display_choice = gets.chomp.to_i
  selected_artist = Artists.all[display_choice]
  selected_artist.albums.each do |cd|
    puts cd.album
  end
end

def edit_artist
  list_artists
  puts "Select artist to edit"
  display_choice = gets.chomp.to_i
  selected_artist = Artists.all[display_choice]
  puts "Enter edit"
  artist_edit = gets.chomp.to_s
  Artists.all[display_choice].edit_artist(artist_edit)
end

def search_artist
  puts "enter an artist to search for"
  user_search = gets.chomp.to_s
  artist_index = Artists.artist_arr.index(user_search)
  if artist_index != nil
    selected_artist = Artists.all[artist_index]
    puts "Albums: "
    selected_artist.albums.each do |cd|
      puts cd.album
    end
  else
    puts "Not in your library, buy more CDs!"
  end
end



main_menu
