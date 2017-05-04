# LatLong

WIP Gem for moving Lat, Long, points based on distance and direction. I expect
to create a Faker module that enables me to use it during geo location apps
testing cases such as, `people 400 around the target`, `people north of the target`,
`people north-west from the target`.

Check [Github Issues](https://github.com/matismasters/lat_long/issues) for backlog
and progress. (WIP)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lat_long'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lat_long

## Usage

Simply tell distance, distance_unit, direction and get a new location hash

```ruby

require 'lat_long'

washington_ave_and_17st_nw = LatLong::Point.new 38.892133, (-77.039498)

new_location = washington_ave_and_17st_nw.move 250, :meters, :north

new_location[:lat]  # 38.892133
new_location[:long] # -77.033727

```

Valid directions:

- `:west`
- `:north_west`
- `:north`
- `:north_east`
- `:east`
- `:south_east`
- `:south`
- `:south_west`

Valid distance units:

- `:meters`
- `:kilometers`
- `:miles`
- `:feet`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/matismasters/lat_long. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
