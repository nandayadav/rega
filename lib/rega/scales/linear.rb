module Rega
  
  module Scales
    
    #Linear Scale
  
    class Linear < Scale
      
      def initialize(points: false, **options)
        @type = 'linear'
        super(**options)
      end
      
    end #Class Scale
    
  end #Module Scales
  
end #Module Rega
