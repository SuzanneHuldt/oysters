require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:entry_station) { double('entry station', :aldgate) }
  let(:exit_station) { double('exit station', :marylebone) }

  describe 'initialize' do
    it 'Check if oystercard has a balance equal to 0' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up) }
    it 'Check if @balance increase after top_up' do
      subject.top_up(5)
      expect(oystercard.balance).to eq(5)
    end
    it 'top_up raise error when above the limit' do
      limit = Oystercard::LIMIT - subject.balance
      money_to_put = limit + 1
      error_top_up = "You are exceeding the limit in your card. You can top_up only #{limit}"
      expect { oystercard.top_up(money_to_put) }.to raise_error(error_top_up)
    end
  end
   describe '#deduct' do
     it 'reduces the balance by certain amount' do
       subject.top_up(50)
       exit_st = 'blah'
       expect(subject.touch_out('blah')).to eq(49)
     end
   end
  describe '#touch_in' do
    xit 'set the card as in use' do
      allow(subject).to receive(:touch_in).and_return(:in_use)
      expect(oystercard.touch_in(entry_station)).to eq(:in_use)
    end
    it 'raises error if balance is less than minimum' do
      entry = 'Aldgate'
      expect { oystercard.touch_in(entry) }.to raise_error('Insufficient balance for travel')
    end
    xit "store the entry station when touching in" do
      subject.top_up(55)
      expect(oystercard.touch_in(entry_station)).to eq(entry_station)
    end
    it 'calls start_journey on an istant of the class Journey' do
      subject.top_up(32)
      entry = 'Aldgate'
      expect(oystercard.touch_in(entry)).to eq(Journey.new.start_journey(entry))
    end

  end
  describe '#touch_out' do
    xit 'check if touch_out reduce balance by minumum fare' do
      subject.top_up(1)
      subject.touch_in(entry_station)
      minimum_fare = Oystercard::MINIMUM_FARE
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(minimum_fare * -1)
    end
    xit 'save exit stastion on touch_out' do
      subject.touch_out(exit_station)
      expect(subject.exit_station).to eq(exit_station)
    end
    xit 'check if touch_out insert an array into journeys' do
     expect{ subject.touch_out(exit_station) }.to change { subject.journeys.count }.by(+1)
    end
    it 'saves current journey in journey history' do
      entry = 'Aldgate'
      expect{subject.touch_out(entry) }.to change {subject.journey_history.count }.by (1)
    end

  end

  describe '#add_journey' do
    it 'adds the current journey to the journey history array' do
        expect{oystercard.add_journey }.to change {oystercard.journey_history.count }.by (1)
      end
    end


end
