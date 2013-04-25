require_relative '../test_helper'

class ScaleTest <  MiniTest::Unit::TestCase

  def setup
    @scale = Rega::Scales::Linear.new(name: 'x', domain: [1..100])
  end
  
  def test_attributes
    attrs = @scale.attributes
    assert_kind_of Hash, attrs
    assert_equal 'x', attrs[:name]
    assert_equal "linear", attrs[:type]
    assert_equal [], attrs[:range]
    assert_equal [1..100], attrs[:domain]
  end
  
end
