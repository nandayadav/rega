require_relative 'test_helper'

class ChartTest <  MiniTest::Unit::TestCase

  def setup
    @chart = Rega::Chart.new([], height: 200)
  end
      
  def test_height
    assert_equal @chart.height, 200, "Height did not macth."
  end
end