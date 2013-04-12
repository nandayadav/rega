require 'json'
module Rega
  #This class composes end json by comibining Visualization object, data object..
  class Chart
    
    attr_accessor :visualization, :axes, :scales, :data, :marks
    def initialize(name, **options)
      @name = name
      options.each { |name, value| instance_variable_set("@#{name}", value) }
    end
    
    #Need - visualization, scales, marks and data
    #Optional - axes
    def generate
      h = @visualization.attributes
      h[:data] = [@data.attributes]
      h[:scales] = @scales.map(&:attributes)
      h[:axes] = @axes.map(&:attributes) if @axes
      h[:marks] = [@marks.attributes]
      h
    end
    
    def sample_json
      h = {:height => 400, :width => 400}
      h[:data] = [{:name => 'table', :values => [{:x => 10, :y => 28}, {:x => 20, :y => 55}, {:x => 30, :y => 43}] }]
      h[:scales] = [
                         {:name => 'x', :type => 'ordinal', :range => 'width', :domain => {:data => 'table', :field => 'data.x'}},
                         {:name => 'y', :range => 'height', :nice => true, :domain => {:data => 'table', :field => 'data.y'}}
                        ]
      h[:axes] = [{:type => 'x', :scale => 'x'}, {:type => 'y', :scale => 'y'}]
      h[:marks] = [{:type => 'rect', 
                          :from => {:data => 'table'},
                          :properties => {
                                                  :enter => {
                                                                    :x => {:scale => 'x', :field => 'data.x'},
                                                                    :width => {:scale => 'x', :band => true, :offset => -1},
                                                                    :y => {:scale => 'y', :field => 'data.y'},
                                                                    :y2 => {:scale => 'y', :value => 0}
                                                                  },
                                                  :update => {:fill => {:value => 'steelblue'}}
                                                }
                          }]
      h.to_json
    end
    

    def scales
      
    end
    
    def axes
      
    end
  end
end

#c = Chart.new(data, {})
#c.render_bar
#c.render_geo

