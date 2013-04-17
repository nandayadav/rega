module Rega
  
  #Represents a generic area chart
  class Line < Chart
    
  
    def initialize(values: [], **options)
      @values = values #Array of values for data
      options.each { |name, value| instance_variable_set("@#{name}", value) }
      associate_defaults
    end
    
    def associate_defaults
      @visualization = Visualization.new(name: "line", padding: { left: 30, right: 30, top: 10, bottom: 40})
      @data = @url ? Data.new(name: 'table', url: @url) : Data.new(name: 'table', values: @values)
      @scales = [
                        Scale.new(name: 'x', type: 'ordinal', range: 'width', domain: {data: 'table', field: 'data.x'}),
                        Scale.new(name: 'y', range: 'height', domain: {data: 'table', field: 'data.y'})
                      ]
                      
      @axes = [
                      Axis.new(scale: 'x', type: 'x'),
                      Axis.new(scale: 'y', type: 'y')
                    ]
      @marks = Marks::Line.new
    end
    
    
  end
end