module Rega
  module Marks
    
    #https://github.com/trifacta/vega/wiki/Marks#symbol
    class Symbol < Mark
    
      #shape: [circle, square, cross, diamond, triangle-up, triangle-down]
      #size: size of the shape
      def initialize(x_field: "data.x", y_field: "data.y", shape: 'circle', **options)
        @type = 'symbol'
        @radius = 100
        @shape = shape
        @x_field, @y_field = x_field, y_field
        super(**options)
      end
      
      def properties
        { 
          enter: {
                      x: {scale: 'x', field: @x_field},
                      y: {scale: 'y', field: @y_field}
                    },
          update: update,
          hover: hover
        }
      end
      
      def update
        super.merge(size: {value: @radius}, shape: {value: @shape})
      end
      
      def hover
        super.merge(size: {value: 2*@radius})
      end
      
    end
    
  end
end
