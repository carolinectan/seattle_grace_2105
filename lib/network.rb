class Network
  attr_reader :name,
              :hospitals

  def initialize(name)
    @name = name
    @hospitals = []
  end

  def add_hospital(hospital)
    @hospitals << hospital
  end

  def highest_paid_doctor
    @hospitals.flat_map do |hospital|
      hospital.doctors
    end.max_by do |doctor|
      doctor.salary
    end

    # (@hospitals.flat_map { |hospital| hospital.doctors}).max_by { |doctor| doctor.salary}

    # all_doctors = @hospitals.map do |hospital|
    #   hospital.doctors
    # end.flatten
    # all_doctors.max_by do |doctor|
    #   doctor.salary
    # end
  end

  def doctors_by_hospital
    doctors_by_hospital = Hash.new { |hash, key| hash[key] = [] }

    @hospitals.select do |hospital|
      hospital.doctors.select do |doctor|
        doctors_by_hospital[hospital] << doctor.name
      end
    end
    doctors_by_hospital
  end

  # result = {}
  #
  #   @hospitals.each do |hospital|
  #     doctor_names = hospital.doctors.map do |doctor|
  #       doctor.name
  #     end
  #     result[hospital] = doctor_names
  #     end
  #   result
  #   end
end


# result = {}
#
# @hospitals.each do |hospital|
#   result[hospital] = hospital.doctors.map do |doctor|
#     doctor.name
#     end
#   end
# result
# end
