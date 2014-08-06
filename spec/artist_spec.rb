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
end