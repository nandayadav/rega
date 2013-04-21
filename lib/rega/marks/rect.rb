module Rega
  module Marks
    
    class Rect < Mark
    
      def initialize(x: "x", y: "y", **options)
        @type = 'rect'
        @x, @y = x, y
        super(**options)
      end
      
      #TODO: this is duplicated betweek chart and marks classes
      def x_field
        "data.#{@x}"
      end
      
      def y_field
        "data.#{@y}"
      end
      
      #Properties for bar chart
      def properties
        {
          enter: {
                        x: {scale: 'x', field: x_field},
                        width: {scale: 'x', band: true, offset: -1},
                        y: {scale: 'y', field: y_field},
                        y2: {scale: 'y', value: 0}
                      },
          update: {fill: {value: @fill_color}, fillOpacity: {value: @fill_opacity}},
          hover: {fill: {value: @hover_color}, fillOpacity: {value: @hover_opacity}}
        }
      end
      
    end
    
  end
end
