# Rega
Keep it simple
This library provides simple Wrapper for generatin JSON that's consumed by VEGA(visualization grammar based on d3.js). It should be used for creating simple, standard charts(bar, line, pie/donut, scatter). More chart types will be added later on. 

Options for consuming the json:
1. Render in html
Rendering chart is done using Vega parser, and can be rendered inside a canvas or svg. More info instructions: https://github.com/trifacta/vega/wiki/Runtime
Also see included example_app, which is a typical sinatra app that has few charts defined and all them are rendered in single page using vega parser. 

2. Server side(headless mode)
https://github.com/trifacta/vega/wiki/Headless-Mode

## Installation

Add this line to your application's Gemfile:

    gem 'rega'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rega

## Usage
include Rega
Bar Chart
bar = Charts::Bar.new(values: [...])
c = bar.generate.to_json or (to customize)
c = bar.generate do |config|
  config.fill_color = '#5cc'
  config.hover_color = 'orange'
end

See example_app(Sinatra app) for more examples

TODO: 
Charts yet to implement
1. Stacked Bar/Area 
2. Treemap
3. Wordcloud
4. Geo maps

c.to_json

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
