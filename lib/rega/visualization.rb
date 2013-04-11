module Rega
  #https://github.com/trifacta/vega/wiki/Visualization
  
  class Visualization
    
    #Ignoring viewport
    attr_accessor :name, :width, :height, :padding
    
    def initialize(name: "", width: 500, height: 500)
      @name = name
      @width, @height = width, height
    end
    
    def attributes
      {:name => @name, :width => @width, :height => @height}
    end
    
  end
end
