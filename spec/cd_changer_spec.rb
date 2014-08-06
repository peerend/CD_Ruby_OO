require 'rspec'
require 'artist'

describe 'Artists' do
  before do
    Artists.clear
  end

  it 'creates an instance of a new Artist' do
    test_artist = Artists.new('David Bowie')
    expect(test_artist).to be_an_instance_of Artists
  end
end