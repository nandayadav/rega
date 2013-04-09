require 'rega/chart'
describe Rega::Chart do
  describe 'instance methods' do
    before(:each) { @chart = Rega::Chart.new }
    it "should have generate method" do
      @chart.should respond_to(:generate)
    end
  end
end
