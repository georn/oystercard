require "station"

  describe Station do
    subject(:station) { described_class.new(1, :a) }

    describe '#zone' do
      it "Tests that the initialized zone number is returned" do
        expect(station.zone).to eq 1
      end
    end

    describe "#name" do
      it "Tests that the initialized name is returned" do
        expect(station.name).to eq :a
      end
    end

  end
