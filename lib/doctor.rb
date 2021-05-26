class Doctor
  attr_reader :name,
              :specialty,
              :education,
              :salary

  def initialize(doctor_hash)
    @name = doctor_hash[:name]
    @specialty = doctor_hash[:specialty]
    @education = doctor_hash[:education]
    @salary = doctor_hash[:salary]
  end
end
