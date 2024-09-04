require 'spec_helper'

RSpec.describe VehicleFactory do 
    before(:each) do
        @factory_1 = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        @vehicles = @factory_1.create_vehicles(@wa_ev_registrations)
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@factory_1).to be_an_instance_of(VehicleFactory)
        end
    end

    describe '#it can create vehicles' do
        it 'creates instances of the vehicle class' do
            expect(@vehicles).to all (be_an_instance_of(Vehicle))
            expect(@vehicles[2]).not_to eq (@vehicles[0])
        end
    end

    describe '#it imports data correctly' do
        it 'can import the vin' do 
            expect(@vehicles[0].vin.length).to be (10)
            expect(@vehicles[10].vin.length).to be (10)
        end

        it 'can import the registration year' do
            expect((@vehicles[2].year).kind_of?(Integer)).to be (true)
        end

        it 'can import the vehicle model' do
            expect((@vehicles[13].model).kind_of?(String)).to be (true)
        end
    end
end