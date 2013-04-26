module Rega
  
  module Scales
    
    #Linear Scale
  
    class Time < Scale
      
      def initialize(clamp: false, nice: true, **options)
        @type = 'time'
        @clamp, @nice = clamp, nice
        super(**options)
      end
      
    end #Class Scale
    
  end #Module Scales
  
end #Module Rega
