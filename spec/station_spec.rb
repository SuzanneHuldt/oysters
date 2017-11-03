require 'station'

describe Station do
  let(:name) { 'Aldgate' }
  subject(:station) { described_class.new(name) }

  describe '#fetching_zone' do
    it 'gets the matching zone from the Zones module.' do
      expect(station.fetch_zone(name)).to eq(2)
    end
  end
end
