module Rega
  module Marks
    
    class Arc < Mark
    
      attr_accessor :inner_radius
      
      def initialize(inner_radius: 80, outer_radius: 130, stroke_color: '#fff', stroke_width: 2, **options)
        @type = 'arc'
        @inner_radius, @outer_radius, @stroke_color, @stroke_width = inner_radius, outer_radius, stroke_color, stroke_width
        super(**options)
      end
      
      #Can either be a numerical value or a scale hash
      def outer_radius_value
        @outer_radius.is_a?(Hash) ? @outer_radius : {value: @outer_radius}
      end
      
      #Can either be a numerical value or a scale hash
      def inner_radius_value
        @inner_radius.is_a?(Hash) ? @inner_radius : {value: @inner_radius}
      end
      
      
      #innerRadius = 0 means pie chart
      #TODO: get rid of x, y hardcoded values
      def properties
        { 
          enter: {
                      x: {value: @x},
                      y: {value: @y},
                      startAngle: {field: 'startAngle'},
                      endAngle: {field: 'endAngle'},
                      innerRadius: inner_radius_value,
                      outerRadius: outer_radius_value,
                      stroke: {value: @stroke_color},
                      strokeWidth: {value: @stroke_width}
                    },
          update: {fill: {scale: 'color', field: @field}, fillOpacity: {value: @fill_opacity}},
          hover: hover
        }
      end
      
    end
    
  end
end
