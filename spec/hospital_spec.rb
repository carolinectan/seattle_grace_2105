require 'rspec'
require './lib/doctor'
require './lib/hospital'

RSpec.describe Hospital do
  before :each do
    @meredith = Doctor.new({
      name: "Meredith Grey",
      specialty: "General Surgery",
      education: "Harvard University",
      salary: 100_000})

    @alex = Doctor.new({
      name: "Alex Karev",
      specialty: "Pediatric Surgery",
      education: "Johns Hopkins University",
      salary: 90_000})

    @seattle_grace = Hospital.new("Seattle Grace", "Richard Webber", [@meredith, @alex])
  end

  describe 'instantiation' do
    it "exists" do
      expect(@meredith).to be_an_instance_of(Doctor)
      expect(@alex).to be_an_instance_of(Doctor)
      expect(@seattle_grace).to be_an_instance_of(Hospital)
    end

    it "has attributes on instantiation" do
      expect(@seattle_grace.name).to eq("Seattle Grace")
      expect(@seattle_grace.chief_of_surgery).to eq("Richard Webber")
      expect(@seattle_grace.doctors).to eq([@meredith, @alex])
    end
  end

  describe 'methods' do
    it "can calculate a total salary" do
      expect(@seattle_grace.total_salary).to eq(190000)
    end

    it "returns name of lowest paid doctor" do
      expect(@seattle_grace.lowest_paid_doctor).to eq("Alex Karev")
    end

    it "returns specialities of doctors" do
      expect(@seattle_grace.specialties).to eq(["General Surgery", "Pediatric Surgery"])
    end
  end
end
