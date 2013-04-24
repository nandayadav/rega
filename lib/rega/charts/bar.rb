module Rega
  
  module Charts
    
    #Represents a generic bar chart with defaults in place
    class Bar < Chart
      
      def initialize(values: [], x: "x", y: "y", **options)
        @values = values
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
        @visualization = Visualization.new(name: "bar", padding: { left: 30, right: 30, top: 10, bottom: 40})
        @data = derived_data
        @scales = [
                          Scale.new(name: 'x', type: 'ordinal', range: 'width', domain: {data: 'table', field: x_field}),
                          Scale.new(name: 'y', range: 'height', domain: {data: 'table', field: y_field})
                        ]
        @axes = [
                        Axis.new(scale: 'x', type: 'x'),
                        Axis.new(scale: 'y', type: 'y')
                      ]
        @marks = [Marks::Rect.new(x_field: x_field, y_field: y_field)]
      end
      
    end #Class Bar
    
  end #Module Charts
  
end #Module Rega
