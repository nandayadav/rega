module Rega

  module Charts
    
    #Generic Donut chart
    #can easily be used to render Pie chart(inner_radius = 0)
    class Donut < Chart
      
      def initialize(values: [], **options)
        @values = values
        super(**options)
        associate_defaults
      end
      
      def associate_defaults
        @visualization = Visualization.new(name: "donut", padding: { left: 30, right: 30, top: 10, bottom: 40})
        #Note the data transform used here..
        @data = Data.new(name: 'table', values: @values, transform: {type: 'pie', value: 'data'})
        @scales = [ Scale.new(name: 'color', type: 'ordinal', range: 'category10') ]
        @marks = Marks::Arc.new
      end
      
    end #Class Donut
      
  end #Module Charts
  
end #Module Rega
