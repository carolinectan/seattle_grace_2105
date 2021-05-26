require 'rspec'
require './lib/doctor'
require './lib/hospital'
require './lib/network'

RSpec.describe do Network
  before :each do
    @gsmn = Network.new("Greater Seattle Medical Network")

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

    @miranda = Doctor.new({
      name: "Miranda Bailey",
      specialty: "General Surgery",
      education: "Stanford University",
      salary: 150_000})

    @derek = Doctor.new({
      name: "Derek Sheperd",
      specialty: "Neurosurgery",
      education: "University of Pennsylvania",
      salary: 125_000})

    @grey_sloan = Hospital.new("Grey Sloan Memorial", "Larry Maxwell", [@miranda, @derek])
  end

  it "exists" do
    expect(@gsmn).to be_an_instance_of(Network)
    expect(@gsmn.name).to eq("Greater Seattle Medical Network")
    expect(@gsmn.hospitals).to eq([])
  end

  it "can add hospitals to network" do
    @gsmn.add_hospital(@seattle_grace)
    @gsmn.add_hospital(@grey_sloan)

    expect(@gsmn.hospitals).to eq([@seattle_grace, @grey_sloan])
  end

  it "has a highest paid doctor" do
    @gsmn.add_hospital(@seattle_grace)
    @gsmn.add_hospital(@grey_sloan)

    expect(@gsmn.hospitals).to eq([@seattle_grace, @grey_sloan])
    expect(@gsmn.highest_paid_doctor).to eq(@miranda)
  end

  it "can sort doctors by hospital" do
    @gsmn.add_hospital(@seattle_grace)
    @gsmn.add_hospital(@grey_sloan)

    expect(@gsmn.hospitals).to eq([@seattle_grace, @grey_sloan])
    # expect(@gsmn.doctors_by_hospital).to be_a(Hash)
    expect(@gsmn.doctors_by_hospital).to eq({
      @seattle_grace => ["Meredith Grey", "Alex Karev"],
      @grey_sloan => ["Miranda Bailey", "Derek Sheperd"]
      })
  end
end
