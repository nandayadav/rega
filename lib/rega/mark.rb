module Rega
  class Mark
    
    #TODO: delegate/forward this to other classes so they can access/modify the value
    attr_accessor :fillcolor
    def initialize(type: 'rect', fillcolor: 'red')
      @type, @fillcolor = type, fillcolor
    end
    
    def attributes
      h = {type: @type, from: {data: 'table'}}
      h[:properties] = properties
      h
    end
    
    def properties
      { :enter => {
                          :x => {:scale => 'x', :field => 'data.x'},
                          :width => {:scale => 'x', :band => true, :offset => -1},
                          :y => {:scale => 'y', :field => 'data.y'},
                          :y2 => {:scale => 'y', :value => 0}
                        },
        :update => {:fill => {:value => @fillcolor}}
      }
    end
    
  end
end
