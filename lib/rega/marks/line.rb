module Rega
  module Marks
    
    class Line < Mark
    
      def initialize(stroke_color: 'red', stroke_width: 2, **options)
        @type = 'line'
        @stroke_color, @stroke_width = stroke_color, stroke_width
        super(**options)
      end
      
      def properties
        { 
          enter: {
                      x: {scale: 'x', field: 'data.x'},
                      interpolate: {value: 'monotone'},
                      y: {scale: 'y', field: 'data.y'},
                      stroke: {value: @stroke_color},
                      strokeWidth: {value: @stroke_width}
                    },
          hover: {fill: {value: @hover_color}}
        }
      end
      
    end
    
  end
end
