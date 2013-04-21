require_relative '../test_helper'

class DonutTest <  MiniTest::Unit::TestCase

  def setup
    @donut = Rega::Charts::Donut.new(values: [12, 45, 34])
  end
      
  def test_value
    assert_equal 'data', @donut.value
    d = Rega::Charts::Donut.new(url: '/some_data_url', indicator: 'tweets')
    assert_equal 'data.tweets', d.value
  end
  
  def test_derived_data
    d = @donut.derived_data
    assert_kind_of Rega::Data, d
    assert_equal [12, 45, 34], d.values
  end
  
  def test_associate_defaults
    pie_transform = {type: 'pie', value: 'data'}
    assert_equal pie_transform, @donut.data.transform
  end
end
