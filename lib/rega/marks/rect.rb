module Rega
  module Marks
    
    class Rect < Mark
    
      def initialize(**options)
        @type = 'rect'
        super(**options)
      end
      
      
      #Properties for bar chart
      def properties
        {
          enter: {
                        x: {scale: 'x', field: 'data.x'},
                        width: {scale: 'x', band: true, offset: -1},
                        y: {scale: 'y', field: 'data.y'},
                        y2: {scale: 'y', value: 0}
                      },
          update: {fill: {value: @fill_color}, fillOpacity: {value: @fill_opacity}},
          hover: {fill: {value: @hover_color}, fillOpacity: {value: @hover_opacity}}
        }
      end
      
    end
    
  end
end
