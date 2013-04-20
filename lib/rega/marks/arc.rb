module Rega
  module Marks
    
    class Arc < Mark
    
      attr_accessor :inner_radius
      
      def initialize(inner_radius: 80, outer_radius: 130, stroke_color: '#fff', stroke_width: 2, **options)
        @type = 'arc'
        @inner_radius, @outer_radius, @stroke_color, @stroke_width = inner_radius, outer_radius, stroke_color, stroke_width
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
                      stroke: {value: @stroke_color},
                      strokeWidth: {value: @stroke_width}
                    },
          update: {fill: {scale: 'color', field: @field}},
          hover: {fill: {value: @hover_color}}
        }
      end
      
    end
    
  end
end
