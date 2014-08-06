require 'rspec'
require 'album'

describe 'Albums' do
  before do
    Albums.clear
  end

  it 'creates a new instance of Albums' do
    test_album = Albums.new('ziggy stardust')
    expect(test_album).to be_an_instance_of Albums
  end

  it 'saves albums' do
    test_album = Albums.new("Bastard")
    test_album.save
    expect(Albums.all[0].album).to eq "Bastard"
  end

  it 'lists all albums' do
    test_album = Albums.new('ziggy stardust').save
    test_album2 = Albums.new('Earl Sweatshirt').save
    test_album3 = Albums.new('Booty Bouncers').save
    expect(Albums.album_arr).to eq ['ziggy stardust','Earl Sweatshirt', 'Booty Bouncers']
  end
end