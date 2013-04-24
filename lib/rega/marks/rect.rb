module Rega
  module Marks
    
    class Rect < Mark
    
      attr_accessor :offset
      def initialize(x_field: "data.x", y_field: "data.y", offset: -2, **options)
        @type = 'rect'
        @x_field, @y_field, @offset = x_field, y_field, offset
        super(**options)
      end
      
      #Properties for bar chart
      def properties
        {
          enter: {
                        x: {scale: 'x', field: @x_field},
                        width: {scale: 'x', band: true, offset: @offset},
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
