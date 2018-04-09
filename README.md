# Fast Activesupport

> This project is built for FUN and not tested in production environment yet. It's been almost 7 years since I stopped writing C therefore these implementations may not be the best ones in terms of performance and code quality. Also the behvaiours of the implementations may vary especially for the error cases like passing the wrong type of argument.

ActiveSupport implemented in C from scratch for speeding it up.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fast_activesupport'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fast_activesupport

## Usage

This gem overrides original ActiveSupport and changes it's methods with the ones written in C. The only thing you have to do is, placing this gem after `activesupport` or `rails` in your Gemfile.

## The list of improved modules/methods

Here is the list of modules and their methods migrated from Ruby to C along with performance improvements.

+ SecurityUtils
  + ::secure_compare (~4 times faster)
  + ::fixed_length_secure_compare (~6.5 times faster)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/meinac/fast_activesupport.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
