module Rega
  
  module Scales
    
    #Linear Scale
  
    class Quantitative < Scale
      
      def initialize(clamp: false, nice: true, **options)
        @type = 'linear'
        @clamp, @nice = clamp, nice
        super(**options)
      end
      
    end #Class Scale
    
  end #Module Scales
  
end #Module Rega
