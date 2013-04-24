module Rega
  
  module Marks
    
    #Represents Visual properties
    #Base class, do not use directly
    class Mark
      
      attr_accessor :fill_color, :hover_color, :fill_opacity, :hover_opacity
      VALID_ATTRS = %w(x x2 y y2 width height stroke stroke_width stroke_opacity inner_radius outer_radius field legend)
      
      def initialize(fill_color: 'red', hover_color: nil, fill_opacity: 1.0, hover_opacity: 0.6, **options)
        @fill_color = fill_color
        @hover_color = hover_color
        @fill_opacity = fill_opacity
        @hover_opacity = hover_opacity
        options.each { |name, value| instance_variable_set("@#{name}", value) }
      end
      
      def attributes
        {type: @type, from: {data: 'table'}, properties: properties}
      end
      
      #Override in child class
      def properties
        {}
      end
      
      def update
        h = {fill: {value: @fill_color}}
        h[:fillOpacity] =  {value: @fill_opacity} if @fill_opacity
        h
      end
      
      def hover
        h = {}
        h[:fill] = {value: @hover_color} if @hover_color
        h[:fillOpacity] =  {value: @hover_opacity} if @hover_opacity
        h
      end
      
    end
  end
end
