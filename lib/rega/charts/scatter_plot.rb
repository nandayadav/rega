module Rega
  
  module Charts
    
    #Represents a generic area chart
    class ScatterPlot < Chart
      
      def initialize(values: [], **options)
        @values = values #Array of values for data
        super(**options)
        associate_defaults
      end
      
      def associate_defaults
        @visualization = Visualization.new(name: "scatter", padding: { left: 30, right: 30, top: 10, bottom: 40})
        @data = derived_data
        @scales = [
                          Scale.new(name: 'x', range: 'width', zero: false, domain: {data: 'table', field: 'data.x'}),
                          Scale.new(name: 'y', range: 'height', domain: {data: 'table', field: 'data.y'})
                        ]
        @axes = [
                        Axis.new(scale: 'x', type: 'x'),
                        Axis.new(scale: 'y', type: 'y')
                      ]
        @marks = [Marks::Symbol.new]
      end
    
    end #Class ScatterPlot
    
  end #Module Charts
  
end #Module Rega
