module Rega
  
  module Scales
  
    #Ordinal Scale
  
    class Ordinal < Scale
      
      def initialize(points: false, **options)
        @type = 'ordinal'
        @points = points
        super(**options)
      end
      
    end #Class Scale
    
  end #Module Scales
  
end #Module Rega
