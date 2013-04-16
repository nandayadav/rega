module Rega
  #https://github.com/trifacta/vega/wiki/Data
  #Requirements/Specifications
  #1. Inline data, 2. dynamically loaded via json/csv..
  #One of either values, source or url must be defined 
  class Data
    
    def initialize(name: '', format: 'json', **options)
      @name, @format = name, format
      options.each { |name, value| instance_variable_set("@#{name}", value) }
    end
    
    #h[:data] = [{:name => 'table', :values => [{:x => 10, :y => 28}, {:x => 20, :y => 55}, {:x => 30, :y => 43}] }]
    def attributes
      h = {name: @name}
      if @values
        h[:values] = @values
      elsif @url #Could be a json endpoint or csv/tsv url
        h[:url] = @url
        h[:format] = @format
      end
      h
    end
    
    def validate
      if @values.nil? && @url.nil?
        raise Exception.new("Either values or url is required")
      end
    end
    
  end
end
