require 'spec_helper'

RSpec.describe DmvDataService do
  before(:each) do
    @dds = DmvDataService.new
  end
  describe '#initialize' do
    xit 'can initialize' do
      expect(@dds).to be_an_instance_of(DmvDataService)
    end
  end

  describe '#load_data' do
    xit 'can load data from a given source' do
      source = 'https://data.colorado.gov/resource/dsw3-mrn4.json'
      data_response = @dds.load_data(source)
      expect(data_response).to be_an_instance_of(Array)
      expect(data_response.size).to be_an(Integer)
    end
  end

  describe '#wa_ev_registrations' do
    xit 'can load washington ev registration data' do
      expect(@dds.wa_ev_registrations.size).to be_an(Integer)
    end
  end

  describe '#co_dmv_office_locations' do
    xit 'can load colorado dmv office locations' do
      expect(@dds.co_dmv_office_locations.size).to be_an(Integer)
    end
  end

  describe '#ny_dmv_office_locations' do
    xit 'can load new york dmv office locations' do
      expect(@dds.ny_dmv_office_locations.size).to be_an(Integer)
    end
  end

  describe '#mo_dmv_office_locations' do
    xit 'can load missouri dmv office locations' do
      expect(@dds.mo_dmv_office_locations.size).to be_an(Integer)
    end
  end
end
