module Rega
  
  module Scales
  #https://github.com/trifacta/vega/wiki/Scales
  
    class Scale
      
      def initialize(name: "", domain: [], range: [], **options)
        @name = name
        @domain, @range = domain, range
        options.each { |name, value| instance_variable_set("@#{name}", value) }
      end
      
      def attributes
        h = {name: @name}
        h[:type] = @type if @type
        h[:range] = @range
        h[:domain] = @domain
        h[:range] = @range
        h[:nice] = @nice if @nice
        h[:zero] = @zero if !@zero.nil?
        h
      end
      
    end #Class Scale
    
  end #Module Scales
  
end #Module Rega
