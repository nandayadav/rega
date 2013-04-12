module Rega
  
  #https://github.com/trifacta/vega/wiki/Axes
  class Axis
    
    def initialize(type: "x", scale: "", **options)
      @type, @scale = type, scale
      options.each { |name, value| instance_variable_set("@#{name}", value) }
    end
    
    def attributes
      {type: @type, scale: @scale}
    end
    
  end
  
end
