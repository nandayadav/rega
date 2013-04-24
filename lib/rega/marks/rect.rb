module Rega
  module Marks
    
    class Rect < Mark
    
      def initialize(x_field: "data.x", y_field: "data.y", **options)
        @type = 'rect'
        @x_field, @y_field = x_field, y_field
        super(**options)
      end
      
      #Properties for bar chart
      def properties
        {
          enter: {
                        x: {scale: 'x', field: @x_field},
                        width: {scale: 'x', band: true, offset: -1},
                        y: {scale: 'y', field: @y_field},
                        y2: {scale: 'y', value: 0}
                      },
          update: update,
          hover: hover,
        }
      end
      
      
      
    end
    
  end
end
