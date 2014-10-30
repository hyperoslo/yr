# Yr

[![Gem Version](https://img.shields.io/gem/v/yr.svg?style=flat)](https://rubygems.org/gems/yr)
[![Build Status](https://img.shields.io/travis/hyperoslo/yr.svg?style=flat)](https://travis-ci.org/hyperoslo/yr)
[![Dependency Status](https://img.shields.io/gemnasium/hyperoslo/yr.svg?style=flat)](https://gemnasium.com/hyperoslo/yr)
[![Code Climate](https://img.shields.io/codeclimate/github/hyperoslo/yr.svg?style=flat)](https://codeclimate.com/github/hyperoslo/yr)
[![Coverage Status](https://img.shields.io/coveralls/hyperoslo/yr.svg?style=flat)](https://coveralls.io/r/hyperoslo/yr)

Yr makes it easy to get weather forecast from Yr.no.

## Installation

Add this line to your application's Gemfile:

    gem 'yr'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yr

## Usage

```
oslo = Yr::Place.find "Oslo"
oslo.forecast.days.each do |day|
  p day.name
  p day.date
  p day.temperature.value
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

Hyper made this. We're a digital communications agency with a passion for good code,
and if you're using this library we probably want to hire you.

Also thanks to https://github.com/Hakon/yr_api for inspiration and some code.

## License

Yr is available under the MIT license. See the LICENSE file for more info.
