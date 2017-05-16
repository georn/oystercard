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

  describe "#deduct" do

    it "deducts an amount from the balance" do
      card.top_up(50)
      expect { card.deduct(1) }.to change { card.balance }.by(-1)
    end

  end

  describe "#in_journey?" do

    it "is initially not in journey" do
      expect(card).not_to be_in_journey
    end

  end

  describe "#touch_in" do

    it "can touch in" do
      card.top_up(Oystercard::MINIMUM_BALANCE)
      card.touch_in
      expect(card).to be_in_journey
    end

    it "raise error if balance is below #{Oystercard::MINIMUM_BALANCE}£" do
      expect{ card.touch_in }.to raise_error "Balance below minimum."
    end
  end

  describe "#touch_out" do

    it "can touch out" do
        card.top_up(Oystercard::MINIMUM_BALANCE)
        card.touch_in
        card.touch_out
        expect(card).not_to be_in_journey
      end
  end
end
