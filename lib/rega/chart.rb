require 'json'
require 'forwardable'
module Rega
  #This class composes end json by comibining Visualization object, data object..
  class Chart
    
    extend Forwardable
    
    def_delegators :@marks, :fill_color, :fill_color=
    def_delegators :@marks, :fill_opacity, :fill_opacity=
    def_delegators :@marks, :hover_opacity, :hover_opacity=
    def_delegators :@marks, :hover_color, :hover_color=
    def_delegators :@marks, :inner_radius, :inner_radius=
    
    attr_accessor :visualization, :axes, :scales, :data, :marks
    
    def initialize(name, **options)
      @name = name
      options.each { |name, value| instance_variable_set("@#{name}", value) }
    end
    
    #Need - visualization, scales, marks and data
    #Optional - axes
    def generate(&block)
      yield self if block_given?
      h = @visualization.attributes
      h[:data] = [@data.attributes]
      h[:scales] = @scales.map(&:attributes) if @scales
      h[:axes] = @axes.map(&:attributes) if @axes
      h[:marks] = [@marks.attributes]
      h
    end
  end
end

