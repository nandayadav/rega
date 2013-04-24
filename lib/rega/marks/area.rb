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
          update: update,
          hover: hover
        }
      end
      
    end
    
  end
end
