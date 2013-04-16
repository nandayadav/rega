require "rubygems"
require "bundler/setup"
Bundler.require

class App < Sinatra::Base
  enable :logging
  use Rack::Session::Cookie
  
  before do
    content_type :json unless request.path_info == '/'
  end

  get '/' do
    File.read(File.join('public','index.html'))
  end
  
  get '/bar' do
    chart = Rega::Bar.new(values: [{ x: 10, y: 20}, { x: 23, y: 12}, { x: 33, y: 52}, { x: 53, y: 102}]) 
    c = chart.generate do |config|
      config.fill_color = 'red'  
      config.hover_opacity = 0.5
    end
    c.to_json
  end

  
  get '/bar_with_external_url' do
    chart = Rega::Bar.new(url: '/data')
    c = chart.generate do |config|
      config.fill_color = 'green'  
    end
    c.to_json
  end
  
  get '/area' do
    chart = Rega::Area.new(values: [{ x: 1, y: 20}, { x: 2, y: 12}, { x: 3, y: 52}, { x: 4, y: 102}]) 
    c = chart.generate do |config|
      config.fill_color = 'green'  
      config.hover_color = 'purple'
    end
    c.to_json
  end
  
  get '/scatter_plot' do
    chart = Rega::ScatterPlot.new(values: [{ x: 1, y: 20}, { x: 2, y: 12}, { x: 3, y: 52}, { x: 4, y: 102}]) 
    c = chart.generate do |config|
      config.fill_color = 'green'  
    end
    c.to_json
  end
  
  get '/data' do
    #[{x: 45, y: 33}, {x: 23, y: 44}, {x: 56, y: 34}].to_json
    [{ x: 1, y: 20}, { x: 2, y: 12}, { x: 3, y: 52}, { x: 4, y: 12}].to_json
  end

end
