# Gittr

[![Code Climate](https://codeclimate.com/github/zoso10/Gittr/badges/gpa.svg)](https://codeclimate.com/github/zoso10/Gittr) [![Test Coverage](https://codeclimate.com/github/zoso10/Gittr/badges/coverage.svg)](https://codeclimate.com/github/zoso10/Gittr)
[![Circle CI](https://circleci.com/gh/zoso10/Gittr.svg?style=svg)](https://circleci.com/gh/zoso10/Gittr)

Gittr is a Ruby wrapper for the Gitter chat client REST API. Check out [Gitter](https://gitter.im/) if you haven't already!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gittr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gittr

## Usage

Creating a client with your API token.

```ruby
Gittr.configure do |config|
  config.token = 'abc123'
end
client = Gittr::Client.new
```

The `Gittr::Client` implements all endpoints as described in the [Gitter Documentation](https://developer.gitter.im/docs/rest-api) for the REST API.

## Contributing

1. Fork it ( https://github.com/zoso10/gittr/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
