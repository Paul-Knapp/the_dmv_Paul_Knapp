class VehicleFactory 
  def create_vehicles(registrations)
    registrations.map do |registration|
        vehicle = Vehicle.new({
            vin: registration[:vin_1_10],
            year: registration[:model_year].to_i,
            make: registration[:make],
            model: registration[:model],
            engine: :ev})
          
    end
  end
end