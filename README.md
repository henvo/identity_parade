# IdentityParade

![IdentityParade](doc/assets/project.jpg)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'identity_parade'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install identity_parade

## Usage

IdentityParade has a very simple API. There are basically only two methods:

``` ruby
# Checks the similarity between to arguments. Returns a number between
# 0 and 1. 0 is no similarity and 1 is a complete duplicate.
IdentityParade.match(arg1, arg2)
# => 0.95

# When matching score is equal or greater than the global +matching_score+
# it returns true - otherwise false.
IdentityParade.match?(arg1, arg2)
# => true
```

## Configuration

IdentityParade can be configured by the `configure` method:

``` ruby
IdentityParade.configure do |config|
  # Blacklist some keys in a hash that should not be compared.
  config.blacklisted_keys = %w[id created_at updated_at]
  # Set the global match score to 80%
  config.match_score = 0.80
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/henvo/identity_parade.

## License

The gem is available as open source under the terms of the [MIT
License](https://opensource.org/licenses/MIT).
