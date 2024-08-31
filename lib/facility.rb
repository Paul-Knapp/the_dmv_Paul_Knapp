require 'date'

class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :collected_fees,
              :registered_vehicles

  def initialize(attributes)
    @name = attributes[:name]
    @address = attributes[:address]
    @phone = attributes[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
    vehicle.registration_date = Date.today
    if @services.include?('Vehicle Registration') == false
      nil
   elsif vehicle.antique? == true
      vehicle.plate_type = :antique
      @collected_fees += 25
   elsif vehicle.electric_vehicle? == true
      vehicle.plate_type = :ev
      @collected_fees += 200
   else
      vehicle.plate_type = :regular
      @collected_fees += 100
   end
  end
end
