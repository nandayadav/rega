module Rega
  
  module Charts
    
    #Represents a generic area chart
    class Area < Chart
      
      def initialize(values: [], **options)
        @values = values #Array of values for data
        options.each { |name, value| instance_variable_set("@#{name}", value) }
        associate_defaults
      end
      
      def associate_defaults
        @visualization = Visualization.new(name: "area", padding: { left: 30, right: 30, top: 10, bottom: 40})
        @data = @url ? Data.new(name: 'table', url: @url) : Data.new(name: 'table', values: @values)
        @scales = [
                          Scale.new(name: 'x', type: 'linear', zero: false, range: 'width', domain: {data: 'table', field: 'data.x'}),
                          Scale.new(name: 'y', type: 'linear', nice: true, range: 'height', domain: {data: 'table', field: 'data.y'})
                        ]
                        
        @axes = [
                        Axis.new(scale: 'x', type: 'x'),
                        Axis.new(scale: 'y', type: 'y')
                      ]
        @marks = Marks::Area.new
      end
      
    end #Class Area
    
  end #Module Charts
  
end #Module Rega
