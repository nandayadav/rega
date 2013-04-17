module Rega
  module Marks
    
    class Symbol < Mark
    
      def initialize(**options)
        @type = 'symbol'
        super(**options)
      end
      
      def properties
        { 
          enter: {
                      x: {scale: 'x', field: 'data.x'},
                      y: {scale: 'y', field: 'data.y'}
                    },
          update: {fill: {value: @fill_color}, size: {value: 50}},
          hover: {fill: {value: @hover_color}, size: {value: 80}}
        }
      end
      
    end
    
  end
end
