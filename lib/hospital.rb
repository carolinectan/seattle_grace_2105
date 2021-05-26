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
    @doctors.map do |doctor|
      doctor.salary
    end.sum

    # total = 0
    # @doctors.each do |doctor|
    #   total += doctor.salary
    # end
    # total

    # @doctors.sum do |doctor|
    #   doctor.salary
    # end
  end

  def lowest_paid_doctor
    @doctors.min_by do |doctor|
      doctor.salary
    end.name

    # lowest_doctor = @doctors[0]
    # @doctors.each do |doctor|
    #  if doctor.salary < lowest_doctor.salary
    #    lowest_doctor = doctor
    #  end
    # end
    # lowest_doctor.name
  end

  # what if >1 doctor have the same specialties
  def specialties
    @doctors.map do |doctor|
      doctor.specialty
    end
  end

end
