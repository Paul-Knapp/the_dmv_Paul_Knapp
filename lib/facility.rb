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
    @services << service.downcase
  end

  def register_vehicle(vehicle)
    if @services.include?('vehicle registration') == false && @services.include?('registration') == false
      nil
    else
      @registered_vehicles << vehicle
      vehicle.registration_date = Date.today
    end
   if vehicle.antique? == true
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

  def administer_written_test(registrant)
    if @services.include?('written test') == false
      false
    elsif registrant.permit == false
      false
    elsif registrant.age < 16
      false
    else
        registrant.license_data[:written] = true
    end
  end

  def administer_road_test(registrant)
    if @services.include?('road test') == false
      false
    else
      registrant.license_data[:license] = true
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?('renew license') == false
      false
    elsif registrant.license_data[:license] == false
      false
    else 
      registrant.license_data[:renewed] = true
    end
  end
end
