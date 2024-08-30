class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees

  def initialize(attributes)
    @name = attributes[:name]
    @address = attributes[:address]
    @phone = attributes[:phone]
    @services = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end
end
