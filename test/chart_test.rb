require_relative 'test_helper'

class ChartTest <  MiniTest::Unit::TestCase

  def setup
    @chart = Rega::Chart.new("bar")
  end
      
  def test_generate
    @chart.visualization = Rega::Visualization.new(name: "Bar", height: 200, padding: { left: 10, right: 10, top: 10 })
    @chart.data = Rega::Data.new(name: "table", values: [ { x: 10, y: 20}, { x: 23, y: 12} ])
    c = @chart.generate
    puts c.inspect
    assert_kind_of Hash, c
  end
end
