require 'json'
module Rega
  class Chart
    
    attr_reader :height
    
    def initialize(data, height: 500, width: 500)
      @height, @width = height, width
      @data = data
    end
    
    def generate_json
      h = {:height => @height, :width => @width}
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

