require "spec_helper"

Rspec.describe Registrant do
    before(:each) do 
        @registrant_1 = Registrant.new('Bruce', 18, true)
    end
end