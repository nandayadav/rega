module Rega
  
  #Represents a generic bar chart with defaults in place
  class Bar < Chart
    
    
    def initialize(values: [])
      @values = values #Array of values for data
      associate_defaults
    end
    
    def associate_defaults
      @visualization = Rega::Visualization.new(name: "bar", padding: { left: 30, right: 30, top: 10, bottom: 10})
      @data = Rega::Data.new(name: 'table', values: @values)
      @scales = [
                        Rega::Scale.new(name: 'x', type: 'ordinal', range: 'width', domain: {data: 'table', field: 'data.x'}),
                        Rega::Scale.new(name: 'y', range: 'height', domain: {data: 'table', field: 'data.y'})
                      ]
      @axes = [
                      Rega::Axis.new(scale: 'x', type: 'x'),
                      Rega::Axis.new(scale: 'y', type: 'y')
                    ]
      @marks = Rega::Mark.new
    end
    
    
    #TODO: Replace this by delegation/forwardable 
    def fillcolor
      @marks.fillcolor
    end
    
    def fillcolor=(val)
      @marks.fillcolor = val
    end
    
    
  end
end
