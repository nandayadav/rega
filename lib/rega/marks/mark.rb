module Rega
  
  module Marks
    
    #Represents Visual properties
    #Base class, do not use directly
    class Mark
      
      attr_accessor :fill_color, :hover_color, :fill_opacity, :hover_opacity
      
      def initialize(fill_color: 'red', hover_color: 'orange', fill_opacity: 1.0, hover_opacity: 1.0)
        @fill_color = fill_color
        @hover_color = hover_color
        @fill_opacity = fill_opacity
        @hover_opacity = hover_opacity
      end
      
      def attributes
        {type: @type, from: {data: 'table'}, properties: properties}
      end
      
    end
  end
end
