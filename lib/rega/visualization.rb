module Rega
  #https://github.com/trifacta/vega/wiki/Visualization
  
  #Top level attribute in the generate hash object
  class Visualization
    
    #Ignoring viewport
    attr_accessor :name, :width, :height, :padding
    
    def initialize(name: "", width: 300, height: 400, padding: {})
      @name = name
      @width, @height = width, height
      @padding = padding
    end
    
    def attributes
      h = {name: @name, width: @width, height: @height}
      h[:padding] = @padding unless @padding.empty?
      h
    end
    
    
  end
end
