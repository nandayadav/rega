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
    c = chart.generate do |config|
      config.fill_color = 'green'
    end
    c.to_json
  end

  
  get '/bar_with_external_url' do
    chart = Bar.new(url: '/data')
    c = chart.generate do |config|
      config.fill_color = 'green'  
    end
    c.to_json
  end
  
  get '/area' do
    chart = Area.new(values: [{ x: 1, y: 20}, { x: 2, y: 12}, { x: 3, y: 52}, { x: 4, y: 102}]) 
    c = chart.generate
    c.to_json
  end
  
  get '/scatter_plot' do
    chart = ScatterPlot.new(values: [{ x: 1, y: 20}, { x: 2, y: 12}, { x: 3, y: 52}, { x: 4, y: 102}]) 
    c = chart.generate do |config|
      #config.fill_color = 'green'  
    end
    c.to_json
  end
  
  get '/donut' do
    #chart = Donut.new(values: [12, 45, 66, 34]) 
    chart = Donut.new(url: '/data2', indicator: 'num_clicks') 
    c = chart.generate
    c.to_json
  end
  
  get '/pie' do
    chart = Donut.new(values: [12, 45, 66, 34]) 
    c = chart.generate do |config|
      config.inner_radius = 0
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
  
  get '/data2' do
    [
      {network: "Twitter", num_posts: 132, num_clicks: 445},
      {network: "Facebook", num_posts: 39, num_clicks: 123},
      {network: "Linkedin", num_posts: 154, num_clicks: 45}
    ].to_json
  end

end
