module Rega

  module Charts
    
    #Generic Donut chart
    #can easily be used to render Pie chart(inner_radius = 0)
    class Donut < Chart
      
      def initialize(values: [], **options)
        @values = values
        options.each { |name, value| instance_variable_set("@#{name}", value) }
        # super(**options)
        associate_defaults
      end
      
      def value
        @indicator ? "data.#{@indicator}" : "data"
      end
      
      def derived_data
        if @url
          Data.new(name: 'table', url: @url) 
        else
          Data.new(name: 'table', values: @values)
        end
      end
      
      def associate_defaults
        @visualization = Visualization.new(name: "donut", padding: { left: 30, right: 30, top: 10, bottom: 40})
        #Note the data transform used here..
        @data = derived_data
        @data.transform = {type: 'pie', value: value}
        @scales = [ Scale.new(name: 'color', type: 'ordinal', range: 'category10') ]
        @marks = Marks::Arc.new(field: value)
      end
      
    end #Class Donut
      
  end #Module Charts
  
end #Module Rega
