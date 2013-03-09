require_relative 'phone'
require_relative 'phoneimport'

importfile = ARGV[0]
exportfile = ARGV[1]

puts "importfile is #{importfile}"
puts "exportfile is #{exportfile}"

iseimport = Phoneimport.new(importfile)

File.open(exportfile,"w") do |file|
  iseimport.create_report.each do |line|
    file.puts line
  end
end