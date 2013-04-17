module Rega
  
  #Represents a generic bar chart with defaults in place
  #Use case: b = Bar.new([{x: 100, y: 200}, {x: 12, y: 45}, ..]); b.generate_json
  
  class Bar < Chart
    
  
    def initialize(values: [], **options)
      @values = values
      options.each { |name, value| instance_variable_set("@#{name}", value) }
      associate_defaults
    end
    
    def associate_defaults
      @visualization = Visualization.new(name: "bar", padding: { left: 30, right: 30, top: 10, bottom: 40})
      @data = @url ? Data.new(name: 'table', url: @url) : Data.new(name: 'table', values: @values)
      @scales = [
                        Scale.new(name: 'x', type: 'ordinal', range: 'width', domain: {data: 'table', field: 'data.x'}),
                        Scale.new(name: 'y', range: 'height', domain: {data: 'table', field: 'data.y'})
                      ]
      @axes = [
                      Axis.new(scale: 'x', type: 'x'),
                      Axis.new(scale: 'y', type: 'y')
                    ]
      @marks = Marks::Rect.new
    end
    
    
  end
end
