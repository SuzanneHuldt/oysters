require 'journey'

describe  Journey do
  let(:entry) { double(:aldgate)}
  let(:exit_st) { double(:marylebone)}

  subject(:journey) { described_class.new }

  describe '#start_journey' do
    it 'bring entry station from oystercard' do
      expect(journey.start_journey(entry)).to eq(entry)
    end
  end

  describe '#end_journey' do
    xit 'bring exit station from oystercard' do
      expect(journey.end_journey(exit_st)).to eq(exit_st)
    end
    it 'puts the entry and exit station into the current journey variable' do
      expect{ subject.append_journey }.to change { subject.current_journey.count }.by(+1)
    end
  end

  describe '#complete' do
    xit 'returns true if exit station is not empty' do
      expect(subject.complete?).to be false
    end
  end

  describe '#fare' do
    it 'returns correct fare based on exit station not being nil' do
      expect(subject.fare).to eq (6)
    end
  end
end
