require_relative '../test_helper'

class RectTest <  MiniTest::Unit::TestCase

  def setup
    @rect = Rega::Marks::Rect.new
  end
      
  def test_properties
    properties = @rect.properties
    keys = properties.keys
    assert_includes keys, :enter
    assert_includes keys, :update
    assert_includes keys, :hover
    assert_equal -2, @rect.offset
  end
end
