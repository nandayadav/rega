module Rega
  
  #Required attributes: type, from(data source)
  class Mark
    
    attr_accessor :fill_color, :hover_color, :fill_opacity, :hover_opacity
    def initialize(type: 'rect', fill_color: 'red', hover_color: 'orange')
      @type, @fill_color, @hover_color = type, fill_color, hover_color
      @hover_opacity = 1.0
      @fill_opacity = 1.0
    end
    
    def attributes
      h = {type: @type, from: {data: 'table'}}
      if @type == 'rect'
        h[:properties] = bar_properties
      elsif @type == 'area' 
        h[:properties] = area_properties
      else
        h[:properties] = scatter_properties
      end
      h
    end
    
    def bar_properties
      { 
        enter: {
                          x: {scale: 'x', field: 'data.x'},
                          width: {scale: 'x', band: true, offset: -1},
                          y: {scale: 'y', field: 'data.y'},
                          y2: {scale: 'y', value: 0}
                  },
        update: {fill: {value: @fill_color}, fillOpacity: {value: @fill_opacity}},
        hover: {fill: {value: @hover_color}, fillOpacity: {value: @hover_opacity}}
      }
    end
    
    def area_properties
      { 
        enter: {
                          x: {scale: 'x', field: 'data.x'},
                          interpolate: {value: 'monotone'},
                          y: {scale: 'y', field: 'data.y'},
                          y2: {scale: 'y', value: 0}
                  },
        update: {fill: {value: @fill_color}, fillOpacity: {value: @fill_opacity}},
        hover: {fill: {value: @hover_color}, fillOpacity: {value: @hover_opacity}}
      }
    end
    
    def scatter_properties
      { 
        enter: {
                          x: {scale: 'x', field: 'data.x'},
                          y: {scale: 'y', field: 'data.y'}
                  },
        update: {fill: {value: @fill_color}, size: {value: 50}},
        hover: {fill: {value: @hover_color}, size: {value: 80}}
      }
    end
    
  end
end
