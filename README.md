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

### Examples
Here are some examples how to use IdentityParade and what to expect.

#### Numerics
``` ruby
IdentityParade.match(1, 1)
=> 1
IdentityParade.match(1, 0)
=> 0.0
```

#### Strings
Strings are compared by the Jarow-Winkler-Algorithm provided by the
gem [fuzzy-string-match](https://github.com/kiyoka/fuzzy-string-match).

``` ruby
IdentityParade.match("hello", "hello")
=> 1.0
IdentityParade.match("hello", "hallo")
=> 0.88
IdentityParade.match("a", "z")
=> 0.0
```

### Arrays
``` ruby
IdentityParade.match([1, 2, 'foo', { a: 'b'}], [1, 2, 'foo', { a: 'b' }])
=> 1.0
IdentityParade.match([1, 2, 'foo', { a: 'b'}], [1, 3, 'foo', { a: 'b' }])
=> 0.75
IdentityParade.match([1, 2, 'foo', { foo: 'bar'}], [])
=> 0.0
```

### Hashes
``` ruby
IdentityParade.match({ a: 'b', c: 'd'}, { a: 'b', c: 'd'})
=> 1.0
IdentityParade.match({ a: 'b', c: 'd'}, { a: 'b', c: 'e'})
=> 0.5
IdentityParade.match({ a: 'b', c: 'd'}, { a: 'x', c: 'y'})
=> 0.0
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

## Writing your own matcher

IdentityParade always looks at the first given data type and tries to
find the corresponding IdentityParade matcher.

If you have a class with the name `Foobar` and want to write your custom
matcher that will work with IdentityParade you have to name it to:
`IdentityParade::Matchers::FoobarMatcher`.

This matcher must inherit from `IdentityParade::Matcher` and implement the
`score` method which returns a float between `0` and `1`.

### Example

``` ruby
module IdentityParade
  module Matchers
    class FoobarMatcher < Matcher
      def score
        # You can access the first given object as +left+ and the
        # other as +right+:

        # When #some_value is the same we have a match
        return 1 if left.some_value == right.some_value

        # Do some more complicated stuff here.

        # If there is no similarity at all return 0
        0
      end
    end
  end
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
