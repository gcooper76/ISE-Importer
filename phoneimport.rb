
class Phoneimport
  attr_reader :phonelist
  
  def initialize(file)
    @phonelist = parse_list(file)
  end
  
  def create_report
    report = []
    @phonelist.each do |ph|
      report << ph.mac(:colon)  + ',Cisco-IP-Phone'
    end
    return report
  end
  
  private
  
  def parse_list(file)
    names = []
    File.open(file,"r") do |f|
      f.each do |l|
        phoneid = l.match(/SEP[A-F0-9]{11,12}/i)[0].upcase
        names << Phone.new(phoneid)
      end
    end
    return names
  end
  
end