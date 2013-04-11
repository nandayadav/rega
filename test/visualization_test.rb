require_relative 'test_helper'

class VisualizationTest <  MiniTest::Unit::TestCase

  def setup
    @visualization = Rega::Visualization.new(name: "Bar", height: 200, padding: { left: 10, right: 10, top: 10 })
  end
      
  def test_width_and_height
    assert_equal @visualization.width, 500, "Width did not match."
    assert_equal @visualization.height, 200, "Height did not match."
  end
  
  def test_attributes
    attrs = @visualization.attributes
    assert_kind_of Hash, attrs
    assert_equal attrs[:height], 200
    assert_equal attrs[:name], "Bar"
    assert_equal attrs[:width], 500
    assert_equal attrs[:padding][:left], 10
  end
  
end
