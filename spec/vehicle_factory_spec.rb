require 'spec_helper'

RSpec.describe VehicleFactory do 
    before(:each) do
        @factory_1 = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@factory_1).to be_an_instance_of(VehicleFactory)
        end
    end

    describe '#it can create vehicles' do
        it '#creates instances of the vehicle class' do
            vehicles = @factory_1.create_vehicles(@wa_ev_registrations)
            expect(vehicles).to all(be_an_instance_of(Vehicle))
            expect(vehicles[2]).not_to eq(vehicles[0])
        end
    end
end