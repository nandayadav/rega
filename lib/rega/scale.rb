module Rega
  class Scale
    def initialize(options = {})
      @type = options[:type] || 'linear'#Ordinal, linear, time...
      @name = options[:name]
      @domain = options[:domain] || []
    end
    
  end
end
