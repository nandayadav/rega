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
    c = Rega::Chart.new([])
    c.generate_json
  end

end
