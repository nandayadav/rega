module Rega
  
  module Charts
    #Represents a generic area chart
    class Line < Chart
      
      def initialize(values: [], **options)
        @values = values
        super(**options)
        associate_defaults
      end
      
      def associate_defaults
        @visualization = Visualization.new(name: "line", padding: { left: 30, right: 30, top: 10, bottom: 40})
        @data = derived_data
        @scales = [
                          Scales::Ordinal.new(name: 'x', range: 'width', domain: {data: 'table', field: 'data.x'}),
                          Scales::Linear.new(name: 'y', range: 'height', domain: {data: 'table', field: 'data.y'})
                        ]
                        
        @axes = [
                        Axis.new(scale: 'x', type: 'x'),
                        Axis.new(scale: 'y', type: 'y')
                      ]
        @marks = [Marks::Line.new]
      end
      
    end #Class Line
    
  end #Module Charts
  
end #Module Rega
