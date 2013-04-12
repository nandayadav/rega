module Rega
  #https://github.com/trifacta/vega/wiki/Visualization
  
  class Visualization
    
    #Ignoring viewport
    attr_reader :name, :width, :height, :padding
    
    def initialize(name: "", width: 500, height: 500, **options)
      @name = name
      @width, @height = width, height
      options.each { |name, value| instance_variable_set("@#{name}", value) }
    end
    
    def attributes
      h = {name: @name, width: @width, height: @height}
      h[:padding] = @padding if @padding
      h
    end
    
    
  end
end
