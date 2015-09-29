require 'alarm'
require 'sensor'
RSpec.describe "tyre pressure alarm" do
        subject { Alarm.new(sensor, notifier) }
        let(:sensor) { double("sensor", :sample_pressure => 17.5) }
  let(:notifier) { double("notifier") }


        before do
    allow( notifier).to receive(:out_of_bounds)
    allow( notifier).to receive(:normal_range)
    subject.check
        end
        
  it "initialize's alarm class with sensor value" do
        subject
  end

  it "makes sure sensor can call sample pressure" do
        expect( sensor ).to receive(:sample_pressure)
        subject.check
  end

  context "low tyre pressure" do
        let(:sensor) { double("sensor", :sample_pressure => 17) }

    it "calls out of bounds on notifier" do
        expect( notifier ).to receive(:out_of_bounds)
        subject.check
    end

  end

  context "high tyre pressure" do
    let(:sensor) { double("sensor", :sample_pressure => 22) }

    it "checks high tyre pressure" do
      expect( notifier ).to receive(:out_of_bounds)
      subject.check
    end
  end

  context "tyre pressure within range" do
    let(:sensor) { double("sensor", :sample_pressure => 18) }

    it "checks false response for alarm when pressure in range" do 
      expect( notifier ).to receive(:normal_range)
      subject.check
    end
  end


end
