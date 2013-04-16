module Rega
  
  #Represents a generic area chart
  class ScatterPlot < Chart
    
  
    def initialize(values: [], **options)
      @values = values #Array of values for data
      options.each { |name, value| instance_variable_set("@#{name}", value) }
      associate_defaults
    end
    
    def associate_defaults
      @visualization = Rega::Visualization.new(name: "scatter", padding: { left: 30, right: 30, top: 10, bottom: 40})
      @data = @url ? Rega::Data.new(name: 'table', url: @url) : Rega::Data.new(name: 'table', values: @values)
      @scales = [
                        Rega::Scale.new(name: 'x', range: 'width', zero: false, domain: {data: 'table', field: 'data.x'}),
                        Rega::Scale.new(name: 'y', range: 'height', domain: {data: 'table', field: 'data.y'})
                      ]
      @axes = [
                      Rega::Axis.new(scale: 'x', type: 'x'),
                      Rega::Axis.new(scale: 'y', type: 'y')
                    ]
      @marks = Rega::Mark.new(type: 'symbol')
    end
    
    
  end
end
