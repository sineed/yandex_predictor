# YandexPredictor

Library for Yandex Predictor API | Библиотека для API Яндекс.Предиктора

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yandex_predictor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yandex_predictor

## Usage

First, create predictor using your access token:

```ruby
  predictor = Yandex::Client.new('your.token')
```

To get list of possible translation directions use #langs method:

```ruby
  predictor.langs
```

To get prediction text use #complete method:

```ruby
  translator.complete('your.word', 'your.lang')
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

