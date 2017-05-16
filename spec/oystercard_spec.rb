require "oystercard"

describe Oystercard do

  subject(:card) { Oystercard.new }

  it "have a balance of zero." do
    expect(card.balance).to eq 0
  end

  describe "#top_up" do

    it "can top up the balance" do
      expect{ card.top_up(1) }.to change{ card.balance }.to 1
    end

    it "raises an error if the maximum balance is exceeded." do
      maximum_balance = Oystercard::BALANCE_LIMIT
      card.top_up(maximum_balance)
      expect{ card.top_up(1) }.to raise_error "Maximum balance of £#{maximum_balance} exceeded"
    end
  end

  describe "#in_journey?" do

    it "is initially not in journey" do
      expect(card).not_to be_in_journey
    end
  end

  describe "#touch_in" do

    let(:station) { double(:station) }

    it "touch in receive an argument" do
      expect(card).to respond_to(:touch_in).with(1).argument
    end

    it "can touch in" do
      card.top_up(Oystercard::MINIMUM_FARE)
      card.touch_in(station)
      expect(card).to be_in_journey
    end

    it "raise error if balance is below #{Oystercard::MINIMUM_FARE}£" do
      expect { card.touch_in(station) }.to raise_error "Balance below minimum."
    end

    it "returns the station" do
      card.top_up(Oystercard::MINIMUM_FARE)
      card.touch_in(station)
      expect(card.entry_station).to eq station
    end
  end

  describe "#touch_out" do

    let(:station) { double(:station) }

    it "can touch out" do
      # card.top_up(Oystercard::MINIMUM_FARE)
      # card.touch_in
      card.touch_out
      expect(card).not_to be_in_journey
    end

    it "deducts #{Oystercard::MINIMUM_FARE} from balance" do
      card.top_up(Oystercard::MINIMUM_FARE)
      expect { card.touch_out }.to change { card.balance }.by(-Oystercard::MINIMUM_FARE)
    end

    it "forgets the entry station" do
      card.top_up(Oystercard::MINIMUM_FARE)
      card.touch_in(station)
      expect {card.touch_out}.to change {card.entry_station}.to(nil)
    end
  end
end
