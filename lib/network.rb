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
    (@hospitals.flat_map { |hospital| hospital.doctors}).max_by { |doctor| doctor.salary}
  end

  def doctors_by_hospital
    doctors_by_hospital = Hash.new #{ |key, value| hash[key] = [] }

    @hospitals.select do |hospital|
      hospital.doctors.select do |doctor|
        doctors_by_hospital[hospital] = doctor.name
      end
    end
  end
end
