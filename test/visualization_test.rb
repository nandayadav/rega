require_relative 'test_helper'

class VisualizationTest <  MiniTest::Unit::TestCase

  def setup
    @visualization = Rega::Visualization.new(name: "Bar", height: 200)
  end
  
  def test_attributes
    attrs = @visualization.attributes
    assert_kind_of Hash, attrs
    assert_equal 200, attrs[:height]
    assert_equal "Bar", attrs[:name]
    assert_equal 300, attrs[:width]
    assert_equal nil, attrs[:padding]
  end
  
end
