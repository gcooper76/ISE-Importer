class Phone
  attr_accessor :name, :port, :mac
  def initialize(name = 'UNKNOWN', port = 'UNKNOWN')
    @name = name.upcase
    @port = port
    @mac = @name.gsub(/SEP|[-\.:]/,'')
  end
  
  def mac(format = :base)
    return @mac if format == :base
    case format
    when :dot
      name.gsub(/SEP|[-\.:]/,'').downcase.scan(/..../).join('.')
    when :colon
      name.gsub(/SEP|[-\.:]/,'').upcase.scan(/../).join(':')
    when :dash
      name.gsub(/SEP|[-\.:]/,'').upcase.scan(/../).join('-')
    end
  end
end