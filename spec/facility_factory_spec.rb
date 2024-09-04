require 'spec_helper'

RSpec.describe Facility_Factory do
    before(:each) do
        @factory_1 = Facility_Factory.new
        @colorado_locations = DmvDataService.new.co_dmv_office_locations
        @new_york_locations = DmvDataService.new.ny_dmv_office_locations
        @missouri_locations = DmvDataService.new.mo_dmv_office_locations
        @co_dmvs = @factory_1.create_facilities(@colorado_locations)
        @ny_dmvs = @factory_1.create_facilities(@new_york_locations)
        @mo_dmvs = @factory_1.create_facilities(@missouri_locations)
    end
    
    describe '#initialize' do
        it 'can initialize' do 
            expect(@factory_1).to be_an_instance_of (Facility_Factory)
        end
    end

    describe '#it can create facilities' do
        it 'creates instances of the facility class' do
            expect(@co_dmvs).to all(be_an_instance_of (Facility))
            expect(@co_dmvs[0]).not_to eq (@co_dmvs[4])
            expect(@ny_dmvs).to all(be_an_instance_of (Facility))
            expect(@ny_dmvs[0]).not_to eq (@ny_dmvs[2])
            expect(@mo_dmvs).to all(be_an_instance_of (Facility))
            expect(@mo_dmvs[0]).not_to eq (@mo_dmvs[2])
        end
    end

    describe '#it imports data correctly' do
        it 'can import the name of a location' do 
            expect(@co_dmvs[0].name).to eq ("DMV Tremont Branch")
            expect(@co_dmvs[3].name).not_to eq ("DMV Tremont Branch")
            expect(@ny_dmvs[0].name).to eq ("HUDSON")
            expect(@co_dmvs[3].name).not_to eq ("DMV Tremont Branch")
            expect(@mo_dmvs[0].name).to eq ("OAKVILLE")
            expect(@mo_dmvs[3].name).not_to eq ("OAKVILLE")

        end

        it 'can import phone numbers' do
            expect(@co_dmvs[0].phone).to eq ('(720) 865-4600')
        end

        it 'can import addresses' do
            expect(@co_dmvs[0].address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
        end
    end
end