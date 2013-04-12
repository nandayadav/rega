require "rubygems"
require "bundler/setup"
Bundler.require

class App < Sinatra::Base
  enable :logging
  use Rack::Session::Cookie
  
  get '/' do
    File.read(File.join('public','index.html'))
  end
  
  get '/chart' do
    content_type :json
    chart = Rega::Bar.new(values: [{ x: 10, y: 20}, { x: 23, y: 12}, { x: 33, y: 52}, { x: 53, y: 102}])
    #That's how we can modify individual attributes, to customize
    #chart.fill_color = 'red'  
    chart.generate.to_json
  end

end
