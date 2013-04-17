require_relative 'test_helper'

class VisualizationTest <  MiniTest::Unit::TestCase

  def setup
    @visualization = Rega::Visualization.new(name: "Bar", height: 200)
  end
  
  def test_attributes
    attrs = @visualization.attributes
    assert_kind_of Hash, attrs
    assert_equal attrs[:height], 200
    assert_equal attrs[:name], "Bar"
    assert_equal attrs[:width], 300
    assert_equal attrs[:padding], nil
  end
  
end
