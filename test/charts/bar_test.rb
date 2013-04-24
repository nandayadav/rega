require_relative '../test_helper'

class BarTest <  MiniTest::Unit::TestCase

  def setup
    @bar = Rega::Charts::Bar.new(values: [12, 45, 34])
    @bar_with_url = Rega::Charts::Bar.new(url: '/data', x: 'indicator1', y: 'indicator2')
  end
      
  def test_x_field
    assert_equal 'data.x', @bar.x_field
    assert_equal 'data.indicator1', @bar_with_url.x_field
  end
  
  def test_y_field
    assert_equal 'data.y', @bar.y_field
    assert_equal 'data.indicator2', @bar_with_url.y_field
  end
  
  def test_associate_defaults
    assert_equal 2, @bar.scales.size
    assert_equal 2, @bar.axes.size
    assert_kind_of Rega::Marks::Rect, @bar.mark 
  end
  
  def test_customization
    bar = Rega::Charts::Bar.new(values: [12, 45, 34])
    bar.generate do |config|
      config.fill_color = 'green'
      config.hover_opacity = 0.5
    end
    assert_equal 'green', bar.fill_color
    assert_equal 0.5, bar.hover_opacity
  end
end
