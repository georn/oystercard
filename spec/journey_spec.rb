require "journey"

describe Journey do

  subject(:journey) { described_class.new }

  describe "#start_journey" do
    it "starts the journey" do
      expect(journey.start_journey(:a)).to eq :a
    end

    it "changes from_station" do
      expect { journey.start_journey(:a) }.to change { journey.from_station }.to :a
    end
  end

  describe "#finish_journey" do
    it "finishes the journey" do
      expect(journey.finish_journey(:b)).to eq :b
    end

    it "changes to_station" do
      expect { journey.finish_journey(:b) }.to change { journey.to_station }.to :b
    end
  end

  describe "#fare" do
    it "returns minimum journey fare when completed journey" do
      journey.start_journey(:a)
      journey.finish_journey(:b)
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end
    it "returns penalty journey fare when there's no start station" do
      journey.finish_journey(:b)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
    it "returns penalty journey fare when there's no finish station" do
      journey.start_journey(:b)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end

end
