module Rega
  
  module Charts
    
    #Represents a generic bar chart with defaults in place
    class Bar < Chart
      
      def_delegators :@mark, :fill_color, :fill_color=
      def_delegators :@mark, :fill_opacity, :fill_opacity=
      def_delegators :@mark, :hover_opacity, :hover_opacity=
      def_delegators :@mark, :hover_color, :hover_color=
      def_delegators :@mark, :offset, :offset=
      
      attr_reader :mark
      
      def initialize(values: [], x: "x", y: "y", **options)
        @values = values
        @x, @y = x, y
        options.each { |name, value| instance_variable_set("@#{name}", value) }
        # super(**options)
        associate_defaults
      end
      
      def x_field
        "data.#{@x}"
      end
      
      def y_field
        "data.#{@y}"
      end
      
      
      def associate_defaults
        @visualization = Visualization.new(name: "bar", padding: { left: 30, right: 30, top: 10, bottom: 40})
        @data = derived_data
        @scales = [
                          Scales::Ordinal.new(name: 'x', range: 'width', domain: {data: 'table', field: x_field}),
                          Scales::Linear.new(name: 'y', range: 'height', domain: {data: 'table', field: y_field})
                        ]
        @axes = [
                        Axis.new(scale: 'x', type: 'x'),
                        Axis.new(scale: 'y', type: 'y')
                      ]
        @mark = Marks::Rect.new(x_field: x_field, y_field: y_field)
        @marks = [@mark]
      end
      
    end #Class Bar
    
  end #Module Charts
  
end #Module Rega
