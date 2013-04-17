module Rega
  module Marks
    
    class Area < Mark
    
      def initialize(**options)
        @type = 'area'
        super(**options)
      end
      
      def properties
        { 
          enter: {
                      x: {scale: 'x', field: 'data.x'},
                      interpolate: {value: 'monotone'},
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
