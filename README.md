# Murphy

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'murphy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install murphy

## Usage

Execute murphy with the default configuration with

````
bundle exec murphy
```

or provide your own rubocop configuration by defining the `inherit_gem` config setting:

```yaml
# my_rubocop.yml
inherit_gem:
  murphy: .rubocop.yml
```

Then you can either run murphy

```
bundle exec murphy -c my_rubocop.yml
```

or run rubocop directly, if your project defines it.

All other rubocop command line arguments will be passed.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/malachewhiz/murphy.
