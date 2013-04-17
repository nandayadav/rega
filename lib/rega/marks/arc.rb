module Rega
  module Marks
    
    class Arc < Mark
    
      attr_accessor :inner_radius
      
      def initialize(inner_radius: 80, outer_radius: 130, **options)
        @type = 'arc'
        @inner_radius, @outer_radius = inner_radius, outer_radius
        super(**options)
      end
      
      
      #innerRadius = 0 means pie chart
      def properties
        { 
          enter: {
                      x: {value: 200},
                      y: {value: 200},
                      startAngle: {field: 'startAngle'},
                      endAngle: {field: 'endAngle'},
                      innerRadius: {value: @inner_radius},
                      outerRadius: {value: @outer_radius},
                      stroke: {value: '#fff'}
                    },
          update: {fill: {value: @fill_color}},
          hover: {fill: {value: @hover_color}}
        }
      end
      
    end
    
  end
end
