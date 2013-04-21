module Rega

  module Charts
    
    #Generic Donut chart
    #can easily be used to render Pie chart(inner_radius = 0)
    class Donut < Chart
      
      def initialize(values: [], inner_radius: 80, **options)
        @values = values
        @inner_radius = inner_radius
        options.each { |name, value| instance_variable_set("@#{name}", value) }
        # super(**options)
        associate_defaults
      end
      
      def indicator_value
        @indicator ? "data.#{@indicator}" : "data"
      end
      
      def legend_value
        @legend ? "data.#{@legend}" : nil
      end
    

      
      def associate_defaults
        @visualization = Visualization.new(name: "donut", padding: { left: 30, right: 30, top: 10, bottom: 40})
        #Note the data transform used here..
        @data = derived_data
        @data.transform = {type: 'pie', value: indicator_value}
        color_scale = Scale.new(name: 'color', type: 'ordinal', range: 'category10') 
        @scales = [color_scale]
        if @proportional
          @scales << Scale.new(name: "r", type: 'sqrt', domain: {data: 'table', field: indicator_value}, range: [@inner_radius, 120])
          @marks = [Marks::Arc.new(field: indicator_value, inner_radius: @inner_radius, outer_radius: {scale: 'r', field: indicator_value})]
        else
          @marks = [Marks::Arc.new(field: indicator_value, inner_radius: @inner_radius)]
        end
        if legend_value
          @scales << Scale.new(name: 'x', type: 'ordinal', range: 'width', domain: {data: 'table', field: legend_value})
          @marks << Marks::Text.new(field: indicator_value, legend: legend_value)
        end
        
          
      end
      
    end #Class Donut
      
  end #Module Charts
  
end #Module Rega
