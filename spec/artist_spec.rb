require 'rspec'
require 'artist'

describe 'Artists' do
  before do
    Artists.clear
  end
  it 'adds an artist to the array of saved contacts' do
    test_artist = Artists.new('bob')
    ruby_artist = Artists.new('Ruby')
    test_artist.save
    ruby_artist.save
    expect(Artists.all).to eq [test_artist, ruby_artist]
  end

  it 'creates an instance of a new Artist' do
    test_artist = Artists.new('David Bowie')
    expect(test_artist).to be_an_instance_of Artists
  end

  it 'lists the artists in an array' do 
    test_artist = Artists.new("Bowie").save
    test_artist2 = Artists.new("Ziggy").save
    expect(Artists.artist_arr).to eq ['Bowie', 'Ziggy']
  end

  it 'allows the user to edit an artist' do
    test_cd = Artists.new('David')
    test_cd.save
    test_cd.edit_artist("david bowie")
    expect(Artists.all[0].artist).to eq ("david bowie")
  end

  it 'it adds a album to a artist' do
    test_artist = Artists.new('Bowie')
    test_artist.save
    test_artist.add_album("Toy")
    expect(test_artist.albums[0].album).to eq "Toy"
  end
  it 'it adds multiple albums to a artist' do
    test_artist = Artists.new('Bowie')
    test_artist.save
    test_artist.add_album("Toy")
    test_artist.add_album("Scary Monsters")
    expect(test_artist.albums[1].album).to eq "Scary Monsters"
  end
end