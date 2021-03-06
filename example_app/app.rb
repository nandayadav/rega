require "rubygems"
require "bundler/setup"
Bundler.require

class App < Sinatra::Base
  enable :logging
  use Rack::Session::Cookie
  include Rega::Charts
  
  before do
    content_type :json unless request.path_info == '/'
  end

  get '/' do
    File.read(File.join('public','index.html'))
  end
  
  get '/bar' do
    chart = Bar.new(values: [{ x: 'A', y: 20}, { x: 'B', y: 12}, { x: 'C', y: 52}, { x: 'D', y: 102}]) 
    c = chart.generate
    c.to_json
  end

  
  get '/bar_with_external_url' do
    chart = Bar.new(url: '/data2', x: 'breed', y: 'indicator_2')
    c = chart.generate
    c.to_json
  end
  
  get '/customized_bar' do
    chart = Bar.new(values: [{ x: 'A', y: 20}, { x: 'B', y: 12}, { x: 'C', y: 52}, { x: 'D', y: 102}]) 
    c = chart.generate do |config|
      config.fill_color = 'green'  
      config.hover_opacity = 0.5
      config.offset = -5
    end
    c.to_json
  end
  
  get '/area' do
    chart = Area.new(values: [{ x: 1, y: 20}, { x: 2, y: 12}, { x: 3, y: 52}, { x: 4, y: 102}]) 
    c = chart.generate
    c.to_json
  end
  
  get '/scatter_plot' do
    chart = ScatterPlot.new(url: '/data_scatter', x: 'indicator_1', y: 'indicator_2') 
    c = chart.generate
    c.to_json
  end
  
  get '/donut' do
    #chart = Donut.new(values: [12, 45, 66, 34]) 
    chart = Donut.new(url: '/data2', indicator: 'indicator_1', legend: 'breed') 
    c = chart.generate
    c.to_json
  end
  
  get '/pie' do
    chart = Donut.new(values: [12, 45, 66, 34], inner_radius: 0) 
    c = chart.generate do |config|
      #config.inner_radius = 0
    end
    c.to_json
  end
  
  get '/proportional_donut' do
    chart = Donut.new(url: '/data2', indicator: 'indicator_2', legend: 'breed', inner_radius: 30, proportional: true) 
    c = chart.generate do |config|
      #config.inner_radius = 0
    end
    c.to_json
  end
  
  get '/line' do
    chart = Line.new(values: [{ x: 1, y: 20}, { x: 2, y: 12}, { x: 3, y: 52}, { x: 4, y: 102}]) 
    c = chart.generate
    c.to_json
  end
  
  get '/data' do
    #[{x: 45, y: 33}, {x: 23, y: 44}, {x: 56, y: 34}].to_json
    [{ x: 1, y: 20}, { x: 2, y: 12}, { x: 3, y: 52}, { x: 4, y: 12}].to_json
  end
  
  get '/data_scatter' do
    result = []
    100.times { result << {indicator_2: rand(500), indicator_1: rand(100)} }
    result.to_json
  end
  
  get '/data2' do
    [
      {breed: "Labrador", indicator_2: 132, indicator_1: 445},
      {breed: "Beagle", indicator_2: 39, indicator_1: 123},
      {breed: "Greyhound", indicator_2: 154, indicator_1: 45},
      {breed: "Wolfhound", indicator_2: 94, indicator_1: 205}
    ].to_json
  end

end
