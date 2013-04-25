module Rega
  
  module Charts
    
    #Represents a generic area chart
    class ScatterPlot < Chart
      
      def initialize(values: [], x: "x", y: "y", **options)
        @values = values #Array of values for data
        @x, @y = x, y
        options.each { |name, value| instance_variable_set("@#{name}", value) }
        associate_defaults
      end
      
      def x_field
        "data.#{@x}"
      end
      
      def y_field
        "data.#{@y}"
      end
      
      def associate_defaults
        @visualization = Visualization.new(name: "scatter", padding: { left: 30, right: 30, top: 10, bottom: 40})
        @data = derived_data
        @scales = [
                          Scales::Linear.new(name: 'x', range: 'width', domain: {data: 'table', field: x_field}),
                          Scales::Linear.new(name: 'y', range: 'height', domain: {data: 'table', field: y_field})
                        ]
        @axes = [
                        Axis.new(scale: 'x', type: 'x'),
                        Axis.new(scale: 'y', type: 'y')
                      ]
        @marks = [Marks::Symbol.new(x_field: x_field, y_field: y_field)]
      end
    
    end #Class ScatterPlot
    
  end #Module Charts
  
end #Module Rega
