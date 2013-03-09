require 'spec_helper'
describe Phone do

  context "No creation criteria created" do
    let(:phone) { Phone.new }
    it "should have the name and port set to unknown" do
      phone.name.should eql('UNKNOWN')
      phone.port.should eql('UNKNOWN')
      
    end
  end

  context "Phone name and Upstream Port Supplied" do
    let(:phone) { Phone.new('SEPE02F6D644aaC','1/0/5') }
    it "should have the phone and port both set correctly" do
      phone.name.should eql('SEPE02F6D644AAC')
      phone.port.should eql('1/0/5')
    end
    it "should have the mac set correctly" do
      phone.mac.should eql('E02F6D644AAC')
    end
  end

  context "Phone name but no port supplied" do
    let(:phone) { Phone.new('SEPE02F6D644AAC') }
    it "should have the " do
      phone.name.should eql('SEPE02F6D644AAC')
      phone.port.should eql('UNKNOWN')
    end
  end

  describe "mac" do
    let(:phone) { Phone.new('SEPE02F6D644AAC') }
    it "should correctly define the MAC address" do
      phone.mac(:colon).should eql('E0:2F:6D:64:4A:AC')
      phone.mac(:dot).should eql('e02f.6d64.4aac')
      phone.mac(:dash).should eql('E0-2F-6D-64-4A-AC')
    end
  end
end