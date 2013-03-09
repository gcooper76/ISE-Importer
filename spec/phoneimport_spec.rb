require 'spec_helper'

describe Phoneimport do
  let(:import) { Phoneimport.new('spec/test/phonelist.txt') }
  
  it "takes a file and creates an array of phone objects" do
    import.phonelist.size.should eql(3)
  end
  
  it "returns a phone name like an array" do
    import.phonelist[0].name.should eql("SEPE02F6D644AAC")
  end
  
  it "returns a phone's mac address" do
    import.phonelist[0].mac(:colon).should eql("E0:2F:6D:64:4A:AC")
  end
  
  describe "#create_report" do
    it "returns an array of MAC,ISE Policy " do
      import.create_report.should be_an_instance_of(Array)
    end
    
    it "returns an array of size 3" do
      import.create_report.size.should eql(3)
    end
    
  end
end