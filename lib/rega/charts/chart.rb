require 'json'
require 'forwardable'
module Rega
  
  module Charts
    #This class composes end json by comibining Visualization object, data object, axes, scales..
    class Chart
      
      extend Forwardable
      
      def_delegators :@marks, :fill_color, :fill_color=
      def_delegators :@marks, :fill_opacity, :fill_opacity=
      def_delegators :@marks, :hover_opacity, :hover_opacity=
      def_delegators :@marks, :hover_color, :hover_color=
      
      #Donut/Pie Chart specific
      def_delegators :@marks, :inner_radius, :inner_radius=
      def_delegators :@marks, :stroke_width, :stroke_width=
      
      #Transform attr
      def_delegators :@data, :transform, :transform=
      
      attr_accessor :visualization, :axes, :scales, :data, :marks, :url
      VALID_ATTRS = %w(visualization axes scales data marks url)
      
      def initialize(**options)
        options.each { |name, value| instance_variable_set("@#{name}", value) if VALID_ATTRS.include?(name) }
      end
      
      def derived_data
        if @url
          Data.new(name: 'table', url: @url) 
        else
          Data.new(name: 'table', values: @values)
        end
      end
      
      #Need - visualization, marks and data
      #Optional - scales, axes(in some cases)
      def generate(&block)
        yield self if block_given?
        h = @visualization.attributes
        h[:data] = [@data.attributes]
        h[:scales] = @scales.map(&:attributes) if @scales
        h[:axes] = @axes.map(&:attributes) if @axes
        #TODo: clean this up
        h[:marks] = @marks.map(&:attributes) if @marks
        h
      end
      
    end
    
  end
  
end

