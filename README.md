# Rega
This library provides simple Wrapper for generatin JSON that's consumed by [VEGA](https://github.com/trifacta/vega) (visualization grammar based on d3.js). It should be used for creating simple, standard charts(bar, line, pie/donut, scatter). More chart types will be added later on. Ultimate goal is easily render charts and graphs in sinatra/rails app using vega runtime parser without writing bunch of javascript. 

CAUTION: under active development, nowhere near ready for production usage yet

[Demo App](http://salty-beyond-8121.herokuapp.com/)

Options for consuming the json:
* Render in html
    * Rendering chart is done using Vega parser, and can be rendered inside a canvas or svg. More info & instructions: https://github.com/trifacta/vega/wiki/Runtime
Also see included example_app, which is a typical sinatra app that has few charts defined and all them are rendered in single page using vega parser. 

* Server side(headless mode)
  * https://github.com/trifacta/vega/wiki/Headless-Mode
  
* Testing generated json
  * Just copy and paste the json into [Vega Editor](http://trifacta.github.io/vega/editor/)

## Installation

Add this line to your application's Gemfile:

    gem 'rega'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rega

##Requirements
Ruby 2.0

Vega & d3 JS for rendering

## Usage
```ruby
include Rega

#Bar chart
bar = Charts::Bar.new(values: [...])
c = bar.generate.to_json
#To customize
c = bar.generate do |config|
  config.fill_color = '#5cc'
  config.hover_color = 'orange'
end
c.to_json

#Donut Chart(with data endpoint)
chart = Donut.new(url: '/data', indicator: 'indicator_1', legend: 'breed') 
c = chart.generate
c.to_json

#Scatter
chart = ScatterPlot.new(url: '/data_scatter', x: 'indicator_1', y: 'indicator_2') 
c = chart.generate
c.to_json

#Sinatra endpoints used above
get '/data' do
  [
    {breed: "Labrador", indicator_2: 132, indicator_1: 445},
    {breed: "Beagle", indicator_2: 39, indicator_1: 123},
    {breed: "Greyhound", indicator_2: 154, indicator_1: 45},
    {breed: "Wolfhound", indicator_2: 94, indicator_1: 205}
  ].to_json
end
  
get '/data_scatter' do
  result = []
  100.times { result << {indicator_2: rand(500), indicator_1: rand(100)} }
  result.to_json
end
```

See example_app(Sinatra app) for more examples

## TODOs: 
Charts yet to implement
* Stacked Bar/Area/Multi Line
* Treemap
* Maps

* Add a validation layer for chart attributes



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
