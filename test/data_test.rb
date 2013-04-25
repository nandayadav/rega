require_relative 'test_helper'

class DataTest <  MiniTest::Unit::TestCase

  def setup
    @data = Rega::Data.new(values: [12, 45, 62]) 
  end
  
  def test_attributes
    attrs = @data.attributes
    assert_kind_of Hash, attrs
    assert_equal [12, 45, 62], attrs[:values]
    assert_equal "table", attrs[:name]
    assert_equal nil, attrs[:format]
  end
  
end
