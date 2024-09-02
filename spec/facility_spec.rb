require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @registrant_1 = Registrant.new('Penny', 16 )
    @registrant_2 = Registrant.new('Bruce', 14, true )
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
  end

  describe '#initialize' do
    it '#can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
      expect(@facility_1.collected_fees).to eq (0)
      expect(@facility_1.registered_vehicles).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#can perform services' do 
    it 'can register vehicles' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to contain_exactly(@cruz)
      expect(@cruz.registration_date).to be_an_instance_of(Date)
      expect(@cruz.plate_type).to be(:regular)
    end

    it '#can administer the written test' do
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data).to eq({:written => false, :license => false, :renewed => false})
      @registrant_1.earn_permit
      @facility_1.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data).to eq({:written => true, :license => false, :renewed => false})
      @facility_1.administer_written_test(@registrant_2)
      expect(@registrant_2.license_data).to eq({:written => false, :license => false, :renewed => false})
    end

    it '#can administer the road test' do
      @facility_1.add_service('Road Test')
      @facility_1.administer_road_test(@registrant_1)
      expect(@registrant_1.license_data).to eq({:written => false, :license => true, :renewed => false})
    end
  end

  describe '#can collect fees' do 
    it 'can collect fees' do 
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.collected_fees).to eq(300)
    end
  end

  describe '#cant provide services it doesnt have' do
    it '#cant register vehicles if it doesnt offer registration' do
      @facility_2.register_vehicle(@cruz)
      expect(@facility_2.registered_vehicles).to eq([])
      @facility_2.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data).to eq({:written => false, :license => false, :renewed => false})
    end
  end

  describe '#unused facility doesnt change' do
    it '#doesnt change at all' do
      expect(@facility_2).to be_an_instance_of(Facility)
      expect(@facility_2.name).to eq('DMV Northeast Branch')
      expect(@facility_2.address).to eq('4685 Peoria Street Suite 101 Denver CO 80239')
      expect(@facility_2.phone).to eq('(720) 865-4600')
      expect(@facility_2.services).to eq([])
      expect(@facility_2.collected_fees).to eq (0)
      expect(@facility_2.registered_vehicles).to eq([])
    end
  end
end
