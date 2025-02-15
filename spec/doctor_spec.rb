require 'rspec'
require './lib/doctor'

RSpec.describe Doctor do
  describe 'instantiation' do
    before :each do
      @meredith = Doctor.new({
        name: "Meredith Grey",
        specialty: "General Surgery",
        education: "Harvard University",
        salary: 100_000
      })
    end

    it "exists" do
      expect(@meredith).to be_an_instance_of(Doctor)
    end

    it "has attributes" do
      expect(@meredith.name).to eq("Meredith Grey")
      expect(@meredith.specialty).to eq("General Surgery")
      expect(@meredith.education).to eq("Harvard University")
      expect(@meredith.salary).to eq(100000)
    end
  end
end
