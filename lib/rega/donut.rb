module Rega

  #Generic Donut chart
  #can easily be used to render Pie chart(inner_radius = 0)
  class Donut < Chart
    
    def initialize(values: [], **options)
      @values = values
      options.each { |name, value| instance_variable_set("@#{name}", value) }
      associate_defaults
    end
    
    def associate_defaults
      @visualization = Rega::Visualization.new(name: "donut", padding: { left: 30, right: 30, top: 10, bottom: 40})
      #Note the data transform used here..
      @data = Rega::Data.new(name: 'table', values: @values, transform: {type: 'pie', value: 'data'})
      @marks = Rega::Mark.new(type: "arc")
    end
    
  end  
end
