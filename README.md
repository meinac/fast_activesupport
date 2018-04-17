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

This gem overrides original ActiveSupport and changes it's methods with the ones written in C. To use the improved methods you should require them one by one or all at once like so;

```ruby
require "fast_activesupport"
require "fast_activesupport/all"
```

## The list of improved modules/methods

Here is the list of modules and their methods migrated from Ruby to C along with performance improvements.

> Following results obtained by comparing the C implementations with `activesupport 6.0.0.alpha` using `ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-darwin16]` on `MacBook Pro (Retina, 15-inch, Mid 2015) 2,2 GHz Intel Core i7 16 GB 1600 MHz DDR3`. You can run all the benchmarks by yourself by cloning the repository into your local environment and running the ruby scripts under the **benchmarks/** directory like so;
`ruby benchmarks/the_name_of_the_benchmark.rb`

+ String
  + #from
    + With argument equal or more than the length of the string (**~1.9 times faster**)
    + With argument less than the length of the string (**~1.6 times faster**)
  + #to
    + With argument equal or more than the length of the string (**~1.6 times faster**)
    + With argument less than the length of the string (**~1.6 times faster**)
  + #first
    + Without argument (**~2.7 times faster**)
    + With argument equal or more than the length of the string (**same-ish**)
    + With argument less than the length of the string (**~1.7 times faster**)
  + #last
    + Without argument (**~2.9 times faster**)
    + With argument equal or more than the length of the string (**same-ish**)
    + With argument less than the length of the string (**~1.9 times faster**)
  + #exclude?
    + With single char string which exists in (**~1.6 times faster**)
    + With single char string which does not exist (**~1.3 times faster**)
    + With string more than one char which exists in (**~1.6 times faster**)
    + With string more than one char which does not exist (**~1.4 times faster**)
+ SecurityUtils
  + ::secure_compare (**~4.2 times faster**)
  + ::fixed_length_secure_compare (**~6.5 times faster**)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/meinac/fast_activesupport.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
