require 'journey'

describe  Journey do
  let(:enter) { 'Marylebone' }

  # subject(:journey) { described_class.new }

  describe '#start_journey' do
    it 'bring entry station from oystercard' do
      expect(Journey.new.start_journey(enter)).to eq(enter)
    end
  end
end
