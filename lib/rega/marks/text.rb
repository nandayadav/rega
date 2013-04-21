module Rega
  module Marks
    
    #Text mark, use it for displaying legends or any other kind of text info that doesn't fit into x, y axes
    class Text < Mark
    
      def initialize(field: nil, legend: nil, fill_color: '#000')
        @type = 'text'
        @field, @legend = field, legend
        @fill_color = fill_color
      end
      
      def properties
        { 
          update: 
                    {
                      y: {value: 350},
                      x: {scale: 'x', field: @legend},
                      text: {field: @legend},
                      fill: {scale: 'color', field: @field}
                    }
        }
      end
      
    end
    
  end
end
