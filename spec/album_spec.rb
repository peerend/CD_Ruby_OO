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
end