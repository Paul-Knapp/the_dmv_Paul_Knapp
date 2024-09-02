require 'spec_helper'

RSpec.describe Factory do 
    before(:each) do
        @factory_1 = VehicleFactory.new
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@factory_1).to be_an_instance_of(VehicleFactory)
        end
    end
end