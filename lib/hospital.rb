class Hospital
  attr_reader :name,
              :chief_of_surgery,
              :doctors

  def initialize(name, chief_of_surgery, doctors)
    @name = name
    @chief_of_surgery = chief_of_surgery
    @doctors = doctors
  end

  def total_salary
    (@doctors.flat_map { |doctor| doctor.salary }).sum
  end

  def lowest_paid_doctor
    @doctors.min_by { |doctor| doctor.salary }.name
  end

  def specialties
    @doctors.flat_map { |doctor| doctor.specialty }
  end
end
